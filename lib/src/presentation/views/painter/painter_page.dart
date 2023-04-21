import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_painter/flutter_painter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_belt/src/domain/repositories/gallery_repository.dart';
import 'package:test_belt/src/internal/di/locator.dart';
import 'package:test_belt/src/presentation/blocs/blocs.dart';

@RoutePage()
class PainterPage extends StatefulWidget {
  const PainterPage({super.key});

  @override
  State<PainterPage> createState() => _PainterPageState();
}

class _PainterPageState extends State<PainterPage> {
  PainterController controller = PainterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Painter'),
        actions: [
          IconButton(
            onPressed: () async {
              final image = await controller.renderImage(const Size(300, 300));
              locator.get<IGalleryRepository>().saveImageToApp(image);
            },
            icon: const Icon(Icons.save_alt),
          ),
        ],
      ),
      body: SafeArea(
        child: BlocListener<ImagePickerBloc, ImagePickerState>(
          listener: (ctx, state) {
            if (state is ImagePickerPickedState && state.image != null) {
              controller.background =
                  ImageBackgroundDrawable(image: state.image!);
            }
          },
          child: FlutterPainter(
            controller: controller,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context
              .read<ImagePickerBloc>()
              .add(const ImagePickerPickEvent(ImageSource.camera));
        },
        child: const Icon(Icons.photo_camera),
      ),
    );
  }
}
