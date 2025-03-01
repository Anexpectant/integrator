import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:integrator/core/utils/services/di/injection.dart';
import 'package:integrator/module/base/data/data_sources/config_local_data_sources.dart';
import 'package:integrator/module/intro/presentation/intro_page.dart';
import 'package:integrator/module/main/presentation/main_page.dart';

part 'initializer_state.dart';

@singleton
class InitializerCubit extends Cubit<InitializerState> {
  InitializerCubit() : super(InitialState());

  Future<String> getBasePage() async {
    await Future.delayed(const Duration(milliseconds: 500));
    final seenState = await getIt<ConfigLocalDataSource>().getIntroSeenState();
    if (seenState) {
      return MainPage.id;
    } else {
      return IntroPage.id;
    }
  }

  exec() async {
    emit(InitialState());
    emit(InitializeSuccess(await getBasePage()));
  }
}
