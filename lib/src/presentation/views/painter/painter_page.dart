import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_painter/flutter_painter.dart';

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
      ),
      body: SafeArea(
        child: FlutterPainter(
          controller: controller,
        ),
      ),
    );
  }
}
