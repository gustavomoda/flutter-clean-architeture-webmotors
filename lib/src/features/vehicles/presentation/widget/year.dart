import 'package:flutter/material.dart';

import '../../domain/entities/vehicle.dart';

class VechileYear extends StatelessWidget {
  const VechileYear({Key? key, required this.vehicle}) : super(key: key);

  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text('Ano', style: theme.textTheme.labelSmall),
        Text('${vehicle.yearFab}/${vehicle.yearModel}', style: theme.textTheme.bodyText1),
      ],
    );
  }
}
