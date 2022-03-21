import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';
import '../../../../config/config.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/entities/vehicle.dart';
import '../../domain/usecases/get_veichiles.dart';

part 'vehicles.g.dart';

enum VehiclesControllerState { inert, fetching, fetched, error, noMoreRecords }

@injectable
class VehiclesController = VehiclesControllerBase with _$VehiclesController;

abstract class VehiclesControllerBase with Store {
  VehiclesControllerBase(this._getVehicles, this._logger);

  final GetVehicles _getVehicles;
  final Logger _logger;

  @observable
  int currentPage = 0;

  @observable
  VehiclesControllerState state = VehiclesControllerState.inert;

  @observable
  String errorMessage = 'VehiclesControllerState.inert';

  @observable
  List<Vehicle> vehicles = [];

  @action
  Future<void> startFetch() async {
    try {
      state = VehiclesControllerState.fetching;
      vehicles = await _getVehicles.startFetch();
      _udateState();
    } on ServerException catch (e) {
      state = VehiclesControllerState.error;
      errorMessage = e.friendlyMessage;
    } catch (e) {
      state = VehiclesControllerState.error;
      errorMessage = kDefaultFeedbakFailure;
    }
  }

  @action
  Future<void> fetchMore() async {
    if (_getVehicles.noMoreRecords || state == VehiclesControllerState.fetching) {
      return;
    }
    try {
      state = VehiclesControllerState.fetching;
      final data = await _getVehicles.fetchMore();
      vehicles = vehicles..addAll(data);
      _logger.d('fetchMore: received ${data.length}, total: ${vehicles.length}');
      _udateState();
    } on ServerException catch (e) {
      state = VehiclesControllerState.error;
      errorMessage = e.friendlyMessage;
    } catch (e) {
      state = VehiclesControllerState.error;
      errorMessage = kDefaultFeedbakFailure;
    }
  }

  void _udateState() {
    state = _getVehicles.noMoreRecords ? VehiclesControllerState.noMoreRecords : VehiclesControllerState.fetched;
    currentPage = _getVehicles.page;
  }
}
