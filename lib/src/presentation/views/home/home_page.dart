import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_belt/src/presentation/blocs/blocs.dart';
import 'package:test_belt/src/presentation/navigation/app_router.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ImagePickerBloc, ImagePickerState>(listener: (ctx, state) {
          if (state is ImagePickerFailureState) {
            showErrorSnackbar(ctx, state.message);
          }
        }),
        BlocListener<GalleryBloc, GalleryState>(listener: (ctx, state) {
          if (state is GalleryFailureState) {
            showErrorSnackbar(ctx, state.message);
          }
        })
      ],
      child: AutoTabsRouter(
        routes: const [
          PainterRoute(),
          GalleryListRoute(),
        ],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
              body: child,
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: tabsRouter.activeIndex,
                onTap: (index) {
                  // here we switch between tabs
                  tabsRouter.setActiveIndex(index);
                },
                items: const [
                  BottomNavigationBarItem(
                    label: 'Painter',
                    icon: Icon(Icons.palette_outlined),
                  ),
                  BottomNavigationBarItem(
                    label: 'Gallery',
                    icon: Icon(Icons.image_search_rounded),
                  ),
                ],
              ));
        },
      ),
    );
  }

  void showErrorSnackbar(
    BuildContext context,
    String message,
  ) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}
