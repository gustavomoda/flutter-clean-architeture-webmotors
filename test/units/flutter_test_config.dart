import 'dart:async';

import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gmodawebmotor/src/injector.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:injectable/injectable.dart';

import '../fixtures/fakers/entites/vehicle_factory.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  setUpAll(() async {
    final testInjector = configureInjection(Environment.test);

    await testInjector.allReady();

    // Mock Dio requests
    testInjector.registerSingleton<DioAdapter>(DioAdapter(dio: testInjector<Dio>()));

    // Register test factores
    testInjector.registerSingleton<Faker>(Faker());

    testInjector.registerSingleton<VehicleFactoryFaker>(VehicleFactoryFaker(testInjector<Faker>()));
  });

  setUp(() async {
    injector<DioAdapter>().reset();
  });

  await testMain();
}
