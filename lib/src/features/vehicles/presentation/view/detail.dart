import 'package:flutter/material.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/widget/custom_app_bar.dart';
import '../../domain/entities/vehicle.dart';
import '../widget/details.dart';

class VehiclesDetail extends StatelessWidget {
  const VehiclesDetail({Key? key, required this.vechile}) : super(key: key);

  final Vehicle vechile;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const CustomAppBar(title: 'Carros'),
        floatingActionButton: ElevatedButton(onPressed: AppRoutes.router.pop, child: const Text('Continuar')),
        body: SingleChildScrollView(
          child: VechileDetailContent(vehicle: vechile),
        ),
      );
}
