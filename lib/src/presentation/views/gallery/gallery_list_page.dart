import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_belt/src/presentation/blocs/blocs.dart';
import 'package:test_belt/src/presentation/views/gallery/widgets/widgets.dart';

@RoutePage()
class GalleryListPage extends StatelessWidget {
  const GalleryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
      ),
      body: SafeArea(
        child: BlocBuilder<GalleryBloc, GalleryState>(
          builder: (ctx, state) {
            if (state is GalleryFailureState) {
              return Text(state.message);
            } else if (state is GalleryLoadingState ||
                state is GalleryUpdatingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GalleryInitState) {
              return const Center(
                child: Text('Not images'),
              );
            } else if (state is GalleryLoadedState) {
              final images = state.images;
              return images.isEmpty
                  ? const Center(
                      child: Text('Not images'),
                    )
                  : GalleryGridView(images: images);
            } else {
              return const Center(
                child: Text('Not images'),
              );
            }
          },
        ),
      ),
    );
  }
}
