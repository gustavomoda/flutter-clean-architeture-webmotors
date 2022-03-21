import 'dart:io';

import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gmodawebmotor/src/features/vehicles/domain/services/vehicles.dart';
import 'package:gmodawebmotor/src/injector.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import '../../../../../fixtures/fakers/entites/vehicle_factory.dart';

void main() {
  group(
    'Vehicle Services',
    () => {
      setUp(() {}),
      test('Get a page', () async {
        const page = 1;
        final expectedData = injector<VehicleFactoryFaker>().generateFakeList(length: 10);
        final mockDio = injector<DioAdapter>();
        mockDio.onGet(
          '/Vehicles',
          (server) => server.reply(HttpStatus.ok, expectedData),
          queryParameters: {'Page': page},
          headers: {},
          data: {},
        );
        final response = await injector<VehicleService>().vehicles(page: page);
        expect(response.data, expectedData);
      }),
      test('No more data (after last page)', () async {
        const page = 10;
        final List<Vehicle> expectedData = [];
        final mockDio = injector<DioAdapter>();
        mockDio.onGet(
          '/Vehicles',
          (server) => server.reply(HttpStatus.ok, []),
          queryParameters: {'Page': page},
          headers: {},
          data: {},
        );
        final response = await injector<VehicleService>().vehicles(page: page);
        expect(response.data, expectedData);
      }),
    },
  );
}
