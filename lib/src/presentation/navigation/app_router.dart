import 'package:auto_route/auto_route.dart';
import 'package:test_belt/src/presentation/views/gallery/gallery.dart';
import 'package:test_belt/src/presentation/views/home/home.dart';
import 'package:test_belt/src/presentation/views/painter/painter.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: HomeRoute.page,
          children: [
            AutoRoute(page: PainterRoute.page),
            AutoRoute(page: GalleryListRoute.page),
          ],
        ),
      ];
}
