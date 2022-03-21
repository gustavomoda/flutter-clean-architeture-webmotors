import 'package:flutter/material.dart';

import '../../domain/entities/vehicle.dart';

class VechileMake extends StatelessWidget {
  const VechileMake({Key? key, required this.vehicle}) : super(key: key);

  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text('Marca', style: theme.textTheme.labelSmall),
        Text(vehicle.make, style: theme.textTheme.bodyText1),
      ],
    );
  }
}
