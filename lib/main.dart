import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:logger/logger.dart';

import 'src/config/config.dart';
import 'src/config/routes/app_routes.dart';
import 'src/core/controllers/theme.dart';
import 'src/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final injector = configureInjection();

  runZonedGuarded(() {
    FlutterError.onError = (details) {
      final logger = injector<Logger>();
      logger.e('Ops! FlutterError.onError', details);
    };
    runApp(const App());
  }, (error, stack) {
    final logger = injector<Logger>();
    logger.e('Ops! Check it!', error, stack);
  });
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  late ThemeData currentTheme;
  late final ThemeController themeController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    themeController = injector<ThemeController>();
    currentTheme = themeController.themeData;
    defineThemeFromSystem();
  }

  @override
  Widget build(BuildContext context) => Observer(builder: (context) {
        currentTheme = themeController.themeData;
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: kAppTitle,
          theme: currentTheme,
          routeInformationParser: AppRoutes.router.routeInformationParser,
          routerDelegate: AppRoutes.router.routerDelegate,
          builder: (context, child) => child ?? const Scaffold(),
        );
      });

  Future<void> defineThemeFromSystem() async {
    await Future.delayed(const Duration(milliseconds: 100));
    if (!mounted) {
      return;
    }
    final _context = AppRoutes.router.routerDelegate.navigatorKey.currentContext;
    if (_context == null) {
      return;
    }
    final platformBrightness = MediaQuery.of(_context).platformBrightness;
    if (platformBrightness != themeController.brightness) {
      themeController.change(platformBrightness);
      setState(() {});
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        defineThemeFromSystem();
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        break;
    }
  }
}
