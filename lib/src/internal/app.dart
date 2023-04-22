import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_belt/src/internal/di/locator.dart';
import 'package:test_belt/src/presentation/blocs/blocs.dart';
import 'package:test_belt/src/presentation/navigation/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  static final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GalleryBloc>.value(value: locator.get()),
        BlocProvider<ImagePickerBloc>.value(value: locator.get()),
      ],
      child: MaterialApp.router(
        theme: ThemeData(useMaterial3: true),
        title: 'Test BELT',
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
