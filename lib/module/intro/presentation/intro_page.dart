import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:integrator/core/utils/services/di/injection.dart';
import 'package:integrator/module/base/data/data_sources/config_local_data_sources.dart';
import 'package:integrator/module/main/presentation/main_page.dart';

@injectable
class IntroPage extends StatefulWidget {
  static const String id = 'IntroPage';

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: () => _onIntroEnd(context),
          child: Text(
            "Open App",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  void _onIntroEnd(context) {
    getIt<ConfigLocalDataSource>().setIntroSeenState(true);
    Navigator.of(context).pushReplacementNamed(
      MainPage.id,
    );
  }
}
