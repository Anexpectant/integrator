import 'package:flutter/material.dart';
import 'package:integrator/core/utils/services/di/injection.dart';
import 'package:integrator/module/intro/presentation/intro_page.dart';
import 'package:integrator/module/main/presentation/main_page.dart';
import 'package:integrator/module/splash/presentation/pages/splash_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  return _routes(settings.arguments)[settings.name]!;
}

Map<String, MaterialPageRoute<dynamic>> _routes(args) => {
      SplashPage.id:
          MaterialPageRoute(builder: (context) => const SplashPage()),
      IntroPage.id: MaterialPageRoute(builder: (context) => getIt<IntroPage>()),
      MainPage.id: MaterialPageRoute(builder: (context) => getIt<MainPage>()),
    };
