import 'package:flutter/material.dart';

import '../../../../core/utils/media_helpers.dart';
import '../../domain/entities/vehicle.dart';
import 'image.dart';
import 'make.dart';
import 'more_info.dart';
import 'price.dart';
import 'year.dart';

class VechileDetailContent extends StatefulWidget {
  const VechileDetailContent({Key? key, required this.vehicle}) : super(key: key);

  final Vehicle vehicle;

  @override
  State<VechileDetailContent> createState() => _State();
}

class _State extends State<VechileDetailContent> {
  late double width;
  late double height;
  late MediaHelper mediaHelper;
  late ThemeData theme;
  late Radius radius;
  late EdgeInsets _innerBodyPaddding;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mediaHelper = MediaHelper.of(context);
    theme = Theme.of(context);
    width = mediaHelper.percentWidth(100);
    radius = Radius.circular(mediaHelper.bWidth(3));
    _innerBodyPaddding = EdgeInsets.symmetric(
      vertical: mediaHelper.bVertical(2),
      horizontal: mediaHelper.bHorizontal(4),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: _innerBodyPaddding.copyWith(top: mediaHelper.bHeight(2)),
          child: Text(
            widget.vehicle.version,
            style: theme.textTheme.titleLarge,
          ),
        ),
        VechileImage(vehicle: widget.vehicle),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            VechilePrice(vehicle: widget.vehicle),
            VechileMake(vehicle: widget.vehicle),
            Padding(
              padding: EdgeInsets.only(right: _innerBodyPaddding.right),
              child: VechileYear(vehicle: widget.vehicle),
            ),
          ],
        ),
        Padding(
          padding: _innerBodyPaddding,
          child: VechileMoreInfo(vehicle: widget.vehicle),
        ),
      ],
    );
  }
}
