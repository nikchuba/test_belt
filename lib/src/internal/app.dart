import 'package:flutter/material.dart';
import 'package:test_belt/src/presentation/navigation/on_generate_route.dart';
import 'package:test_belt/src/presentation/navigation/routes.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      onGenerateRoute: onGenerateRoute,
      initialRoute: Routes.home,
    );
  }
}
