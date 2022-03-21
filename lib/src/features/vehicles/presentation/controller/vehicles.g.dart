// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicles.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VehiclesController on VehiclesControllerBase, Store {
  final _$currentPageAtom = Atom(name: 'VehiclesControllerBase.currentPage');

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  final _$stateAtom = Atom(name: 'VehiclesControllerBase.state');

  @override
  VehiclesControllerState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(VehiclesControllerState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$errorMessageAtom = Atom(name: 'VehiclesControllerBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$vehiclesAtom = Atom(name: 'VehiclesControllerBase.vehicles');

  @override
  List<Vehicle> get vehicles {
    _$vehiclesAtom.reportRead();
    return super.vehicles;
  }

  @override
  set vehicles(List<Vehicle> value) {
    _$vehiclesAtom.reportWrite(value, super.vehicles, () {
      super.vehicles = value;
    });
  }

  final _$startFetchAsyncAction =
      AsyncAction('VehiclesControllerBase.startFetch');

  @override
  Future<void> startFetch() {
    return _$startFetchAsyncAction.run(() => super.startFetch());
  }

  final _$fetchMoreAsyncAction =
      AsyncAction('VehiclesControllerBase.fetchMore');

  @override
  Future<void> fetchMore() {
    return _$fetchMoreAsyncAction.run(() => super.fetchMore());
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage},
state: ${state},
errorMessage: ${errorMessage},
vehicles: ${vehicles}
    ''';
  }
}
