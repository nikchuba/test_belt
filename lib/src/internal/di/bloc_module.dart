import 'package:get_it/get_it.dart';
import 'package:test_belt/src/presentation/blocs/gallery_list_bloc/gallery_bloc.dart';
import 'package:test_belt/src/presentation/blocs/image_picker_bloc/image_picker_bloc.dart';

void init(GetIt locator) {
  locator
    ..registerSingletonAsync(
      () async => GalleryBloc(await locator.getAsync())
        ..add(
          const GalleryLoadEvent(),
        ),
    )
    ..registerSingletonAsync(
      () async => ImagePickerBloc(await locator.getAsync()),
    );
}
