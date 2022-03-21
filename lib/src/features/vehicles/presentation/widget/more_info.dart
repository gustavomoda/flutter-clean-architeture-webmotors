import 'package:flutter/material.dart';

import '../../domain/entities/vehicle.dart';

class VechileMoreInfo extends StatelessWidget {
  const VechileMoreInfo({Key? key, required this.vehicle}) : super(key: key);

  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _wrap('Modelo', vehicle.model, theme),
        _wrap('Cor', vehicle.color, theme),
        _wrap(vehicle.km == 0 ? '' : 'Km', vehicle.km == 0 ? 'Zero' : vehicle.km.toString(), theme),
      ],
    );
  }

  Widget _wrap(String label, String value, ThemeData theme) =>
      Wrap(alignment: WrapAlignment.center, crossAxisAlignment: WrapCrossAlignment.center, children: [
        if (label.isNotEmpty) Text(label, style: theme.textTheme.labelSmall),
        if (label.isNotEmpty) const SizedBox(width: 4),
        Text(value, style: theme.textTheme.bodyText1),
      ]);
}
