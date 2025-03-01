// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:integrator/application_entry.dart' as _i698;
import 'package:integrator/core/utils/services/alert_handler/alert_handler_cubit.dart'
    as _i473;
import 'package:integrator/core/utils/services/logger/logger.dart' as _i708;
import 'package:integrator/core/utils/step_builder/domain/step_controller_cubit.dart'
    as _i158;
import 'package:integrator/module/base/data/data_sources/base_local_data_source.dart'
    as _i649;
import 'package:integrator/module/base/data/data_sources/config_local_data_sources.dart'
    as _i214;
import 'package:integrator/module/intro/presentation/intro_page.dart' as _i926;
import 'package:integrator/module/main/presentation/main_page.dart' as _i293;
import 'package:integrator/module/splash/domain/bloc/initializer_cubit.dart'
    as _i392;

const String _dev = 'dev';

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i649.LocalDataSource>(
    () => _i649.LocalDataSource(),
    registerFor: {_dev},
  );
  gh.factory<_i293.MainPage>(() => _i293.MainPage());
  gh.factory<_i926.IntroPage>(() => _i926.IntroPage());
  gh.factory<_i158.StepControllerCubit>(() => _i158.StepControllerCubit());
  gh.factory<_i698.ApplicationEntry>(() => _i698.ApplicationEntry());
  gh.singleton<_i392.InitializerCubit>(() => _i392.InitializerCubit());
  gh.singleton<_i473.AlertHandlerCubit>(() => _i473.AlertHandlerCubit());
  gh.singleton<_i708.Logger>(() => _i708.Logger());
  gh.factory<_i214.ConfigLocalDataSource>(
    () => _i214.ConfigLocalDataSource(),
    registerFor: {_dev},
  );
  return getIt;
}
