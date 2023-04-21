import 'package:flutter/material.dart';
import 'package:test_belt/src/presentation/navigation/routes.dart';
import 'package:test_belt/src/presentation/views/home/home_page.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.home:
      return MaterialPageRoute(
        settings: settings,
        builder: ((context) => const HomePage()),
      );
    default:
      throw UnimplementedError();
  }
}
