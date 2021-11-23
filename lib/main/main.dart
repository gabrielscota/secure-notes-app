import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../chacha20_page.dart';
import '../new_note_page.dart';
import '../ui/components/components.dart';
import '../ui/pages/pages.dart';
import 'factories/factories.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Intl.defaultLocale = 'en_US';

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
      themeMode: ThemeMode.system,
      initialRoute: Routes.splash,
      defaultTransition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 400),
      navigatorKey: _navigatorKey,
      scaffoldMessengerKey: _scaffoldMessengerKey,
      getPages: [
        GetPage(
          name: Routes.splash,
          page: makeSplashPage,
          transition: Transition.noTransition,
        ),
        GetPage(
          name: Routes.home,
          page: makeHomePage,
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 400),
        ),
        GetPage(
          name: Routes.note,
          page: makeNotePage,
          transition: Transition.downToUp,
        ),
        GetPage(
          name: '/new_note',
          page: () => const NewNotePage(),
        ),
        GetPage(
          name: '/chacha20',
          page: () => const Chacha20Page(),
        ),
      ],
    );
  }
}
