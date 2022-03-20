import 'package:faker/faker.dart' show Faker, faker;
import 'package:gmodawebmotor/src/features/vehicles/domain/entities/vehicle.dart';
import 'package:injectable/injectable.dart';

import 'abstract_factor.dart';

@test
@singleton
class VehicleFactoryFaker extends ModelFactoryFaker<Vehicle> {
  VehicleFactoryFaker(Faker faker) : super(faker);

  @override
  Vehicle generateFake() => Vehicle(
        id: randomPositiveInt,
        make: faker.lorem.word(),
        model: faker.lorem.word(),
        version: faker.lorem.sentence(),
        image: faker.internet.httpsUrl(),
        km: randomPositiveInt,
        price: faker.randomGenerator.decimal(scale: 2, min: 1).toStringAsPrecision(2),
        yearModel: randomYear,
        yearFab: randomYear,
        color: faker.lorem.word(),
      );

  @override
  List<Vehicle> generateFakeList({required int length}) => List.generate(length, (index) => generateFake());
}
