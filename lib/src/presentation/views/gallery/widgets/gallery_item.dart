import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_belt/src/presentation/blocs/blocs.dart';

class GalleryItem extends StatelessWidget {
  const GalleryItem({super.key, required this.imageFile});

  final File imageFile;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Image.file(imageFile),
          Positioned(
            right: 0,
            child: IconButton(
              color: Colors.white,
              onPressed: () {
                context.read<GalleryBloc>().add(
                      GalleryDeleteImageEvent(imageFile.path),
                    );
              },
              icon: const Icon(Icons.delete),
            ),
          ),
        ],
      ),
    );
  }
}
