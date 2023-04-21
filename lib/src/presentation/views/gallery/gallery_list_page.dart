import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class GalleryListPage extends StatelessWidget {
  const GalleryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
      ),
    );
  }
}
