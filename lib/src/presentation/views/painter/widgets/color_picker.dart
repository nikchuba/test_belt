import 'package:flutter/material.dart';
import 'package:flutter_painter/flutter_painter.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({
    super.key,
    this.controller,
    required this.colors,
  });

  final PainterController? controller;
  final List<Color> colors;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: widget.colors.length,
      itemBuilder: (ctx, i) {
        final color = widget.colors[i];
        final isSelected = widget.controller?.freeStyleColor == color;
        return IconButton(
          padding: EdgeInsets.zero,
          isSelected: isSelected,
          onPressed: () {
            widget.controller?.freeStyleColor = color;
          },
          icon: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.decelerate,
            height: isSelected ? 30 : 20,
            width: isSelected ? 30 : 20,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        );
      },
    );
  }
}
