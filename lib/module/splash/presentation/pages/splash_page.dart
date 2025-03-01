import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:integrator/core/constants/assets.dart';
import 'package:integrator/core/constants/numbers/font_sizes.dart';
import 'package:integrator/core/constants/numbers/spacings.dart';
import 'package:integrator/core/styles/colors.dart';
import 'package:integrator/core/utils/services/di/injection.dart';
import 'package:integrator/core/utils/services/logger/logger.dart';
import 'package:integrator/module/base/presentation/page_wrapper.dart';
import 'package:integrator/module/splash/domain/bloc/initializer_cubit.dart';

class SplashPage extends StatefulWidget {
  static const String id = 'SplashPage';

  const SplashPage({
    super.key,
  });

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500));
    getIt<InitializerCubit>().exec();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InitializerCubit, InitializerState>(
        listener: (BuildContext context, state) {
          getIt<Logger>().debug(state.toString(), title: 'splash listener');
          if (state is InitializeSuccess) {
            Navigator.of(context).popUntil((route) => route.isFirst);
            Navigator.pushReplacementNamed(context, state.pageId,
                arguments: true);
          }
        },
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    Assets.IC_SPLASH,
                    height: Responsive.isMobile(context)
                        ? Spacings.sizeLg
                        : Spacings.sizeXXl,
                    width: Responsive.isMobile(context)
                        ? Spacings.sizeLg
                        : Spacings.sizeXXl,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: Spacings.nanoSize,
                ),
                Text(
                  "Integrator",
                  style: TextStyle(
                    fontSize: Responsive.isMobile(context)
                        ? k14TextFontSize
                        : k16TextFontSize,
                    fontFamily: "RubikMonoOne",
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
