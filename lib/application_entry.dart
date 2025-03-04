import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:integrator/module/splash/domain/bloc/initializer_cubit.dart';
import 'package:integrator/module/splash/presentation/pages/splash_page.dart';
import 'package:oktoast/oktoast.dart';
import 'package:integrator/core/styles/themes.dart';
import 'package:integrator/core/utils/scroll_behavior/custom_scroll_behavior.dart';
import 'package:integrator/core/utils/services/di/injection.dart';
import 'package:integrator/core/utils/services/localization/languages.dart';
import 'package:integrator/core/utils/services/logger/logger.dart';
import 'package:integrator/core/utils/services/navigation/route_and_navigation_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@injectable
class ApplicationEntry extends StatefulWidget {
  @override
  State<ApplicationEntry> createState() => _ApplicationEntryState();
}

class _ApplicationEntryState extends State<ApplicationEntry> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MultiBlocProvider(
        providers: [
          BlocProvider.value(value: getIt<InitializerCubit>()),
        ],
        child: MaterialApp(
          title: 'Integrator',
          onGenerateRoute: generateRoute,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: Languages.localizationsDelegates,
          supportedLocales: Languages.supportedLocales,
          scrollBehavior: MyCustomScrollBehavior(),
          theme: AppTheme.lightTheme,
          locale: Locale('en'),
          builder: (BuildContext context, Widget? widget) {
            getIt<Logger>()
                .debug(widget.toString(), title: 'material builder issue');
            if (widget == null) return Container();
            return OKToast(
              textAlign: TextAlign.start,
              textDirection: Directionality.of(context),
              dismissOtherOnShow: true,
              position: ToastPosition.top,
              child: widget,
            );
          },
          home: SplashPage(),
        ));
  }
}
