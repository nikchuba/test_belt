import 'package:flutter/material.dart';
import 'package:test_belt/src/internal/app.dart';
import 'package:test_belt/src/internal/di/locator.dart' as locator;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  locator.build();
  await locator.locator.allReady();

  runApp(const App());
}
