// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:integrator/core/utils/services/alert_handler/alert_handler_cubit.dart'
    as _i473;
import 'package:integrator/core/utils/services/logger/logger.dart' as _i708;
import 'package:integrator/core/utils/step_builder/domain/step_controller_cubit.dart'
    as _i158;

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
  gh.factory<_i158.StepControllerCubit>(() => _i158.StepControllerCubit());
  gh.singleton<_i473.AlertHandlerCubit>(() => _i473.AlertHandlerCubit());
  gh.singleton<_i708.Logger>(() => _i708.Logger());
  return getIt;
}
