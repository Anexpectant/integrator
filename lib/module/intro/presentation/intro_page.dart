import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:injectable/injectable.dart';
import 'package:integrator/core/constants/assets.dart';
import 'package:integrator/core/constants/numbers/font_sizes.dart';
import 'package:integrator/core/constants/numbers/spacings.dart';
import 'package:integrator/core/styles/colors.dart';
import 'package:integrator/core/utils/services/di/injection.dart';
import 'package:integrator/module/base/data/data_sources/config_local_data_sources.dart';
import 'package:integrator/module/base/presentation/page_wrapper.dart';
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
      backgroundColor: primaryColor,
      body: Center(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              SvgPicture.asset(
                Assets.IC_SPLASH,
                height: Responsive.isMobile(context)
                    ? Spacings.sizeLg
                    : Spacings.sizeXXl,
                width: Responsive.isMobile(context)
                    ? Spacings.sizeLg
                    : Spacings.sizeXXl,
                color: Colors.white,
              ),
              const SizedBox(height: 16),
              Text(
                'INTEGRATOR',
                style: TextStyle(
                  fontSize: Responsive.isMobile(context)
                      ? k18TextFontSize
                      : k20TextFontSize,
                  fontFamily: "RubikMonoOne",
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Automated Package Integration in a Flutter Project',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Responsive.isMobile(context)
                      ? k12TextFontSize
                      : k14TextFontSize,
                  fontFamily: "RubikMonoOne",
                  color: Colors.white,
                ),
              ),
              const Spacer(flex: 3),
                ElevatedButton(
                  onPressed: () {
                    _onIntroEnd(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF6A1B9A),
                    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 24),                  
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    'Open App',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ),
              const SizedBox(height: 16), // فاصله از پایین
            ],
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