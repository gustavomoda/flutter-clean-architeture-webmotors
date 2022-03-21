import 'package:flutter/material.dart';

import '../../../../core/utils/media_helpers.dart';
import '../../domain/entities/vehicle.dart';

class VechilePrice extends StatelessWidget {
  const VechilePrice({Key? key, required this.vehicle}) : super(key: key);

  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) {
    final mediaHelper = MediaHelper.of(context);
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: mediaHelper.bVertical(2),
        horizontal: mediaHelper.bHorizontal(4),
      ),
      color: theme.colorScheme.primary.withOpacity(0.8),
      child: Text(
        'R\$ ${vehicle.price}',
        style: (theme.textTheme.headline6 ?? const TextStyle()).merge(
          TextStyle(
            color: theme.colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
