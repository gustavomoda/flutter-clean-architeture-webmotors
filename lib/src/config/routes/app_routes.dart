import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/vehicles/presentation/view/index.dart';

mixin AppRoutes {
  static const vehicles = '/';
  static const vehicle = '/vehicle/:id';
  static const settings = '/settings';
  static const about = '/about';

  static final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: vehicles,
        builder: (context, state) => const VehiclesIndex(),
      ),
      GoRoute(
        path: settings,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: settings,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: about,
        builder: (context, state) => const AboutScreen(),
      ),
    ],
  );
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('SettingsScreen'),
        ),
      );
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('AboutScreen'),
        ),
      );
}
