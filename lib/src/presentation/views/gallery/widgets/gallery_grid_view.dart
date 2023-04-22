import 'dart:io';

import 'package:flutter/material.dart';

import 'gallery_item.dart';

class GalleryGridView extends StatelessWidget {
  const GalleryGridView({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: images.length,
      itemBuilder: (ctx, i) {
        final file = File.fromUri(Uri.parse(images[i]));
        return GalleryItem(
          imageFile: file,
        );
      },
    );
  }
}
