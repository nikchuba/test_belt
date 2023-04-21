import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_belt/src/presentation/blocs/blocs.dart';

@RoutePage()
class GalleryListPage extends StatelessWidget {
  const GalleryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<GalleryListBloc>().add(const GalleryListLoadEvent());
            },
            icon: const Icon(Icons.replay_outlined),
          )
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<GalleryListBloc, GalleryListState>(
          builder: (ctx, state) {
            if (state is GalleryListFailureState) {
              return Text(state.message);
            } else if (state is GalleryListLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GalleryListEmptyState) {
              return const Center(child: Text('Not images'));
            } else if (state is GalleryListLoadedState) {
              final images = state.images;
              return images.isEmpty
                  ? const Center(
                      child: Text('Not images'),
                    )
                  : ListView.separated(
                      itemCount: images.length,
                      separatorBuilder: (ctx, index) =>
                          const SizedBox(height: 8),
                      itemBuilder: (ctx, i) {
                        return Image.file(File.fromUri(Uri.parse(images[i])));
                      },
                    );
            } else {
              return const Text('JHJHKJHJKHKJHk');
            }
          },
        ),
      ),
    );
  }
}
