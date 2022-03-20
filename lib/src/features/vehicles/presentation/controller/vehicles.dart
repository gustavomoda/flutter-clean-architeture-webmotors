import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import '../../domain/entities/vehicle.dart';
import '../../domain/usecases/get_veichiles.dart';

part 'vehicles.g.dart';

enum VehiclesControllerState { inert, fetching, fetched, error, noMoreRecords }

@injectable
class VehiclesController = VehiclesControllerBase with _$VehiclesController;

abstract class VehiclesControllerBase with Store {
  VehiclesControllerBase(this._getVehicles);

  final GetVehicles _getVehicles;

  @observable
  int currentPage = 0;

  @observable
  VehiclesControllerState state = VehiclesControllerState.inert;

  @observable
  List<Vehicle> vehicles = [];

  @action
  Future<void> startFetch() async {
    state = VehiclesControllerState.fetching;
    vehicles = await _getVehicles.startFetch();
    _udateState();
  }

  @action
  Future<void> fetchMore() async {
    if (_getVehicles.noMoreRecords) {
      return;
    }
    final data = (await _getVehicles.startFetch()).toSet();
    vehicles = vehicles..addAll(data);
    _udateState();
  }

  void _udateState() {
    state = _getVehicles.noMoreRecords ? VehiclesControllerState.noMoreRecords : VehiclesControllerState.fetched;
    currentPage = _getVehicles.page;
  }
}
