import 'package:injectable/injectable.dart';
import 'package:integrator/core/utils/services/di/injection.dart';
import 'package:integrator/core/utils/services/logger/logger.dart';

@Injectable(env: [Environment.dev], order: -1)
class LocalDataSource {
  init() async {
    final watch = Stopwatch()..start();
    await exec();
    getIt<Logger>().debug('elapsed time of init: ${watch.elapsed.inSeconds}');
  }

  exec() {}
}
