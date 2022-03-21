import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../../../../config/config.dart';
import '../../../../core/error/exceptions.dart';
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
    logger.d('Fetching Vehicles, page=$page');
    try {
      final response = await service.vehicles(page: page);
      noMoreRecords = response.data.isEmpty;
      logger.d('Fetched Vehicles, page=$page, noMoreRecords=$noMoreRecords, data=${response.data}');
      return response.data;
    } on DioError catch (e, s) {
      logger.e('Fail Fetching Vehicles', e, s);
      String m = (e.response?.statusCode ?? 0) == 0 ? kDefaultFeedbakDisconected : kDefaultFeedbakFailure;
      throw ServerException(m, e);
    } catch (e, s) {
      logger.e('Fail Fetching Vehicles', e, s);
      throw ServerException(kDefaultFeedbakFailure, e);
    }
  }
}
