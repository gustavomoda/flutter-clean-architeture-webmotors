import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../entities/vehicle.dart';
import '../services/vehicles.dart';

@injectable
class GetVehicles {
  GetVehicles(this.service, this.logger);

  final VehicleService service;
  final Logger logger;

  int page = 0;

  bool noMoreRecords = false;

  Future<List<Vehicle>> startFetch() async {
    page = 0;
    noMoreRecords = false;
    return fetchMore();
  }

  Future<List<Vehicle>> fetchMore() async {
    if (noMoreRecords) {
      return [];
    }
    page = page + 1;
    logger.d('Fecthing Vehicles, page=$page');
    final response = await service.vehicles(page: page);
    noMoreRecords = response.data.isEmpty;
    logger.d('Vehicles Fetched, page=$page, noMore=$noMoreRecords, data=${response.data}');
    return response.data;
  }
}
