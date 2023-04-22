import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_painter/flutter_painter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_belt/src/domain/repositories/gallery_repository.dart';
import 'package:test_belt/src/internal/di/locator.dart';
import 'package:test_belt/src/presentation/blocs/blocs.dart';
import 'package:test_belt/src/presentation/views/painter/widgets/widgets.dart';

@RoutePage()
class PainterPage extends StatefulWidget {
  const PainterPage({super.key});

  @override
  State<PainterPage> createState() => _PainterPageState();
}

class _PainterPageState extends State<PainterPage> {
  late final ImagePickerBloc pickerBloc;
  late final GalleryBloc galleryBloc;
  late final PainterController pController;

  @override
  void initState() {
    pickerBloc = context.read();
    galleryBloc = context.read();
    pController = PainterController(
      settings: const PainterSettings(
        freeStyle: FreeStyleSettings(mode: FreeStyleMode.draw),
        scale: ScaleSettings(maxScale: 10),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    pController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ValueListenableBuilder(
          valueListenable: pController,
          builder: (context, controller, _) {
            final mode = pController.settings.freeStyle.mode;
            return Row(children: buildFreestyleModes(mode));
          },
        ),
        actions: getAppBarActions(),
      ),
      body: SafeArea(
        child: BlocListener<ImagePickerBloc, ImagePickerState>(
          listener: (ctx, state) {
            if (state is ImagePickerPickedState) {
              pController.background =
                  ImageBackgroundDrawable(image: state.image);
            }
          },
          child: Stack(
            children: [
              FlutterPainter(controller: pController),
              Positioned(
                bottom: 16,
                left: 16,
                child: Container(
                  height: 100,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 5,
                          offset: const Offset(0, 5),
                        )
                      ]),
                  child: ValueListenableBuilder(
                    valueListenable: pController,
                    builder: (context, controller, _) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: ColorPicker(
                            controller: pController,
                            colors: const [
                              Colors.black,
                              Colors.red,
                              Colors.orange,
                              Colors.green,
                              Colors.yellow,
                              Colors.purple,
                            ],
                          ),
                        ),
                        Slider(
                          min: 1.0,
                          max: 10.0,
                          value: controller.settings.freeStyle.strokeWidth,
                          onChanged: (val) {
                            pController.freeStyleStrokeWidth = val;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: BlocBuilder<ImagePickerBloc, ImagePickerState>(
        builder: (context, state) {
          final isPicking = state is ImagePickerPickingState;
          return FloatingActionButton(
            onPressed: isPicking ? null : showImageSourceBottomSheet,
            child: isPicking
                ? const Padding(
                    padding: EdgeInsets.all(16),
                    child: CircularProgressIndicator(),
                  )
                : const Icon(Icons.image),
          );
        },
      ),
    );
  }

  List<Widget> buildFreestyleModes(FreeStyleMode currentMode) {
    final activeColor = Theme.of(context).colorScheme.onSurfaceVariant;
    final unactiveColor = activeColor.withOpacity(0.3);
    final isDrawing = currentMode == FreeStyleMode.draw;
    final isErasing = currentMode == FreeStyleMode.erase;
    final isScaling = currentMode == FreeStyleMode.none;
    return [
      IconButton(
        color: isDrawing ? activeColor : unactiveColor,
        onPressed: () {
          updateMode(FreeStyleMode.draw, false);
        },
        icon: const Icon(Icons.edit),
      ),
      IconButton(
        color: isErasing ? activeColor : unactiveColor,
        onPressed: () {
          updateMode(FreeStyleMode.erase, false);
        },
        icon: const Icon(Icons.edit_off_outlined),
      ),
      IconButton(
        color: isScaling ? activeColor : unactiveColor,
        onPressed: () {
          updateMode(FreeStyleMode.none, true);
        },
        icon: const Icon(Icons.zoom_out_map_rounded),
      ),
    ];
  }

  void updateMode(
    FreeStyleMode mode,
    bool scalingEnabled,
  ) =>
      pController
        ..freeStyleMode = mode
        ..scalingEnabled = scalingEnabled;

  List<Widget> getAppBarActions() {
    return [
      IconButton(
        onPressed: () {
          if (pController.canUndo) pController.undo();
        },
        icon: const Icon(Icons.arrow_back_ios_rounded),
      ),
      IconButton(
        onPressed: () {
          if (pController.canRedo) pController.redo();
        },
        icon: const Icon(Icons.arrow_forward_ios_rounded),
      ),
      IconButton(
        onPressed: saveImage,
        icon: const Icon(Icons.save_alt),
      ),
      IconButton(
        onPressed: () {
          pController.clearDrawables();
        },
        icon: const Icon(Icons.clear_all_rounded),
      ),
    ];
  }

  void showImageSourceBottomSheet() {
    showModalBottomSheet(
      context: context,
      clipBehavior: Clip.hardEdge,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: () => pickImage(ImageSource.gallery),
              leading: const Icon(Icons.image_sharp),
              title: const Text('Pick image from gallery'),
            ),
            ListTile(
              onTap: () => pickImage(ImageSource.camera),
              leading: const Icon(Icons.camera_alt_rounded),
              title: const Text('Pick image from camera'),
            ),
          ],
        );
      },
    );
  }

  void pickImage(ImageSource source) {
    Navigator.of(context).pop();
    pickerBloc.add(ImagePickerPickEvent(source));
  }

  void saveImage() async {
    final image = await pController.renderImage(const Size(300, 300));
    galleryBloc.add(GalleryAddImageEvent(image));
  }
}
