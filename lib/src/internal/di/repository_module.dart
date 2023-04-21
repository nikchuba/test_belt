import 'package:get_it/get_it.dart';
import 'package:test_belt/src/data/repositories/repositories.dart';
import 'package:test_belt/src/domain/repositories/repositories.dart';

void init(GetIt locator) {
  locator.registerSingletonAsync<IGalleryRepository>(() async => 
    GalleryRepository(
      locator.get(),
      await locator.getAsync(),
    ),
  );
}
