import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gmodawebmotor/src/features/vehicles/domain/entities/vehicle.dart';
import 'package:gmodawebmotor/src/features/vehicles/domain/services/vehicles.dart';
import 'package:gmodawebmotor/src/features/vehicles/domain/usecases/get_veichiles.dart';
import 'package:gmodawebmotor/src/injector.dart';
import 'package:logger/logger.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../fixtures/fakers/entites/vehicle_factory.dart';
import 'vehicles_test.mocks.dart';

@GenerateMocks([VehicleService, Response])
void main() {
  group(
    'Get Vehicles Use Cases',
    () => {
      test('Get a page', () async {
        // Expected data
        final List<Vehicle> expectedData = injector<VehicleFactoryFaker>().generateFakeList(length: 10);

        // Creating mocks
        final mockVehicleService = MockVehicleService();
        final mockReturn = HttpResponse<List<Vehicle>>(expectedData, MockResponse());

        // Creating target to test
        final useCase = GetVehicles(mockVehicleService, injector<Logger>());

        // Defining Beheave
        when(mockVehicleService.vehicles(page: 1)).thenAnswer((_) async => Future.value(mockReturn));

        // Running
        final actual = await useCase.startFetch();

        // Asserts
        expect(actual, expectedData);
        expect(useCase.page, 1);
        expect(useCase.noMoreRecords, false);
      }),
      test('No more data (after last page)', () async {
        // Expected data
        final List<Vehicle> expectedData = [];

        // Creating mocks
        final mockVehicleService = MockVehicleService();
        final mockReturn = HttpResponse<List<Vehicle>>(expectedData, MockResponse());

        // Creating target to test
        final useCase = GetVehicles(mockVehicleService, injector<Logger>());

        // Defining Beheave
        const lastPage = 9;
        useCase.page = lastPage;
        when(mockVehicleService.vehicles(page: lastPage + 1)).thenAnswer((_) async => Future.value(mockReturn));
        when(mockVehicleService.vehicles(page: lastPage + 2)).thenAnswer((_) async => Future.value(mockReturn));

        // Running
        final actual = await useCase.fetchMore();

        // Asserts
        expect(actual, expectedData);
        expect(useCase.page, lastPage + 1);
        expect(useCase.noMoreRecords, true);

        // Running again when noMoreRecords is true
        await useCase.fetchMore();
        verifyNever(mockVehicleService.vehicles(page: lastPage + 2));
      }),
    },
  );
}
