import 'package:faker/faker.dart';

abstract class ModelFactoryFaker<T> {
  ModelFactoryFaker(this.faker);

  final Faker faker;

  // Generate a single fake model.
  T generateFake();

  // Generate fake list based on provided length.
  List<T> generateFakeList({required int length}) => List.generate(length, (index) => generateFake());

  int get randomPositiveInt => faker.randomGenerator.integer(9000000, min: 1);

  int get randomYear => faker.randomGenerator.integer(2030, min: 2000);
}
