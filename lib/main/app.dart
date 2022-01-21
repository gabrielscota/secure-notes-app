import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import '../ui/pages/pages.dart';
import '../ui/theme/theme.dart';
import 'factories/factories.dart';

class App extends StatelessWidget {
  const App({final Key? key}) : super(key: key);

  static final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(final BuildContext context) => GetMaterialApp(
        title: 'Notes',
        debugShowCheckedModeBanner: false,
        color: const Color(0xFFFCFCFC),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('pt', 'BR'),
        ],
        fallbackLocale: const Locale('en', 'US'),
        theme: AppTheme.lightThemeData,
        darkTheme: AppTheme.darkThemeData,
        initialRoute: Routes.splash,
        defaultTransition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 300),
        navigatorKey: _navigatorKey,
        scaffoldMessengerKey: _scaffoldMessengerKey,
        getPages: [
          GetPage(
            name: Routes.splash,
            page: makeSplashPage,
            transition: Transition.fadeIn,
          ),
          GetPage(
            name: Routes.home,
            page: makeHomePage,
          ),
          GetPage(
            name: Routes.note,
            page: makeNotePage,
          ),
        ],
      );
}
