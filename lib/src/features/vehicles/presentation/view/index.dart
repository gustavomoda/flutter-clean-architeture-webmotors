import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:logger/logger.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/controllers/theme.dart';
import '../../../../core/widget/custom_app_bar.dart';
import '../../../../core/widget/message_error_try_agai.dart';
import '../../../../injector.dart';
import '../controller/vehicles.dart';
import '../widget/card.dart';
import '../widget/loadings.dart';

class VehiclesIndex extends StatefulWidget {
  const VehiclesIndex({Key? key}) : super(key: key);

  @override
  State<VehiclesIndex> createState() => _VehiclesIndexState();
}

class _VehiclesIndexState extends State<VehiclesIndex> {
  final ScrollController _scrollController = ScrollController();

  late final VehiclesController _controller;

  late final Logger _logger;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    _controller = injector<VehiclesController>();
    _controller.startFetch();
    _logger = injector<Logger>();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const CustomAppBar(title: 'Carros'),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.vertical - kToolbarHeight,
            ),
            child: Observer(
              builder: (context) => Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                children: [
                  const SizedBox(width: double.infinity, height: 20),
                  ..._controller.vehicles.map((e) => VechileCard(vehicle: e)).toList(),
                  _loading,
                  if (_controller.state == VehiclesControllerState.error)
                    MessageErrorTryAgain(message: _controller.errorMessage, onPressed: _controller.startFetch)
                ],
              ),
            ),
          ),
        ),
      );

  Widget get _loading => Visibility(
        visible: _controller.state == VehiclesControllerState.fetching,
        child: const LoadingVechiles(),
      );

  Future<void> _scrollListener() async {
    if (!mounted ||
        !_scrollController.hasClients ||
        [VehiclesControllerState.noMoreRecords, VehiclesControllerState.fetching].contains(_controller.state)) {
      return;
    }

    final position = _scrollController.position;
    final offset = position.pixels + (position.maxScrollExtent * 0.2);

    if (offset < position.maxScrollExtent) {
      return;
    }

    _logger.d('Scrool Listener, fetch more');
    await _controller.fetchMore();
  }
}
