// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    GalleryListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GalleryListPage(),
      );
    },
    ImageDetailsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ImageDetailsPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    PainterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PainterPage(),
      );
    },
  };
}

/// generated route for
/// [GalleryListPage]
class GalleryListRoute extends PageRouteInfo<void> {
  const GalleryListRoute({List<PageRouteInfo>? children})
      : super(
          GalleryListRoute.name,
          initialChildren: children,
        );

  static const String name = 'GalleryListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ImageDetailsPage]
class ImageDetailsRoute extends PageRouteInfo<void> {
  const ImageDetailsRoute({List<PageRouteInfo>? children})
      : super(
          ImageDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ImageDetailsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PainterPage]
class PainterRoute extends PageRouteInfo<void> {
  const PainterRoute({List<PageRouteInfo>? children})
      : super(
          PainterRoute.name,
          initialChildren: children,
        );

  static const String name = 'PainterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
