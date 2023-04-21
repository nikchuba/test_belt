import 'dart:ui';

import 'enums/paint_mode.dart';

class PaintInfo {
  const PaintInfo({
    this.offset,
    this.paint,
    this.mode,
  });

  final PaintMode? mode;
  final Paint? paint;
  final List<Offset?>? offset;
}
