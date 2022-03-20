import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
  final ScrollController scrollController = ScrollController();

  late final VehiclesController controller;

  @override
  void initState() {
    super.initState();
    controller = injector<VehiclesController>();
    controller.startFetch();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text('Carros')),
          body: SingleChildScrollView(
            controller: scrollController,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight:
                    MediaQuery.of(context).size.height - MediaQuery.of(context).padding.vertical - kToolbarHeight,
              ),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                children: [
                  ...controller.vehicles.map((e) => VechileCard(vehicle: e)).toList(),
                  Visibility(
                    visible: controller.state == VehiclesControllerState.fetching,
                    child: const LoadingVechiles(),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
