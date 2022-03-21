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

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeController = injector<ThemeController>();
    return Observer(
      builder: (context) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: kAppTitle,
        theme: themeController.themeData,
        routeInformationParser: AppRoutes.router.routeInformationParser,
        routerDelegate: AppRoutes.router.routerDelegate,
      ),
    );
  }
}
