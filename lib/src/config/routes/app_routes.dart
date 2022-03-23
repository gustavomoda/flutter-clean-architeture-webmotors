import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import '../../features/vehicles/domain/entities/vehicle.dart';
import '../../features/vehicles/presentation/view/detail.dart';
import '../../features/vehicles/presentation/view/index.dart';

mixin AppRoutes {
  static const vehicles = '/';
  static const vehicle = '/detail';

  static final GoRouter router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    routes: <GoRoute>[
      GoRoute(
        path: vehicles,
        builder: (context, state) => const VehiclesIndex(),
      ),
      GoRoute(
        path: vehicle,
        builder: (context, state) => VehiclesDetail(
          vechile: state.extra as Vehicle,
        ),
      ),
    ],
  );
}
