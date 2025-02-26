import 'package:injectable/injectable.dart';
import 'package:integrator/module/base/data/data_sources/base_local_data_source.dart';

@Injectable(env: [Environment.dev])
class ConfigLocalDataSource extends LocalDataSource {
  final String configurationBoxName = 'configurationBox';

  @override
  exec() async {}
}
