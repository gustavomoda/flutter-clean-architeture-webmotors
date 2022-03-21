import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../entities/vehicle.dart';
part 'vehicles.g.dart';

@injectable
@singleton
@RestApi()
abstract class VehicleService {
  @factoryMethod
  factory VehicleService(Dio dio) = _VehicleService;

  @GET('/Vehicles')
  Future<HttpResponse<List<Vehicle>>> vehicles({@Query('Passssge') int? page = 1});
}
