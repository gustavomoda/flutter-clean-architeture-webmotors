import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gmodawebmotor/src/features/vehicles/domain/entities/vehicle.dart';
import 'package:gmodawebmotor/src/features/vehicles/domain/usecases/get_veichiles.dart';
import 'package:gmodawebmotor/src/features/vehicles/presentation/controller/vehicles.dart';
import 'package:gmodawebmotor/src/injector.dart';
import 'package:logger/logger.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fakers/entites/vehicle_factory.dart';
import 'vehicles_test.mocks.dart';

@GenerateMocks([GetVehicles])
void main() {
  group(
    'Vehicle Controller',
    () => {
      test('Start fetch', () async {
        // Expected data
        final List<Vehicle> expectedData = injector<VehicleFactoryFaker>().generateFakeList(length: 10);

        // Creating mocks
        final mockGetVehicles = MockGetVehicles();

        // Creating target to test
        final controller = VehiclesController(mockGetVehicles, injector<Logger>());

        // Defining Beheave
        when(mockGetVehicles.noMoreRecords).thenReturn(false);
        when(mockGetVehicles.page).thenReturn(1);
        when(mockGetVehicles.startFetch()).thenAnswer((_) async => Future.value(expectedData));

        // Running
        await controller.startFetch();

        // Asserts
        expect(controller.vehicles, expectedData);
        expect(controller.currentPage, 1);
        expect(controller.state, VehiclesControllerState.fetched);
      }),
      test('Fetch more', () async {
        // Expected data
        final List<Vehicle> expectedData = injector<VehicleFactoryFaker>().generateFakeList(length: 15);

        // Creating mocks
        final mockGetVehicles = MockGetVehicles();

        // Creating target to test
        final controller = VehiclesController(mockGetVehicles, injector<Logger>());

        // Defining Beheave
        when(mockGetVehicles.startFetch()).thenAnswer((_) async => Future.value(expectedData.sublist(0, 10)));
        when(mockGetVehicles.fetchMore()).thenAnswer((_) async => Future.value(expectedData.sublist(10)));
        when(mockGetVehicles.noMoreRecords).thenReturn(false);
        when(mockGetVehicles.page).thenReturn(1);

        // Running
        await controller.startFetch();
        await controller.fetchMore();

        // Asserts
        expect(controller.vehicles, expectedData);
        expect(controller.currentPage, 1);
        expect(controller.state, VehiclesControllerState.fetched);
      }),
      test('No more data', () async {
        // Expected data
        final List<Vehicle> expectedData = injector<VehicleFactoryFaker>().generateFakeList(length: 10);

        // Creating mocks
        final mockGetVehicles = MockGetVehicles();

        // Creating target to test
        final controller = VehiclesController(mockGetVehicles, injector<Logger>());

        // Defining Beheave
        when(mockGetVehicles.startFetch()).thenAnswer((_) async => Future.value(expectedData));
        when(mockGetVehicles.fetchMore()).thenAnswer((_) async => Future.value([]));
        when(mockGetVehicles.noMoreRecords).thenReturn(true);
        when(mockGetVehicles.page).thenReturn(1);

        // Running
        await controller.startFetch();
        await controller.fetchMore();

        // Asserts
        expect(controller.vehicles, expectedData);
        expect(controller.currentPage, 1);
        expect(controller.state, VehiclesControllerState.noMoreRecords);
      })
    },
  );
}
