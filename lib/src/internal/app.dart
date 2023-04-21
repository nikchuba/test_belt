import 'package:flutter/material.dart';
import 'package:test_belt/src/presentation/navigation/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  static final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(useMaterial3: true),
      title: 'Test BELT',
      routerConfig: _appRouter.config(),
    );
  }
}
