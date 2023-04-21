import 'package:get_it/get_it.dart';
import 'datasource_module.dart' as datasources;
import 'repository_module.dart' as repositorys;
import 'bloc_module.dart' as blocs;

final locator = GetIt.I;

void build() {
  datasources.init(locator);
  repositorys.init(locator);
  blocs.init(locator);
}
