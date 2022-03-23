import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/media_helpers.dart';
import '../../domain/entities/vehicle.dart';
import 'image.dart';
import 'make.dart';
import 'more_info.dart';
import 'price.dart';
import 'year.dart';

class VechileCard extends StatefulWidget {
  const VechileCard({Key? key, required this.vehicle}) : super(key: key);

  final Vehicle vehicle;

  @override
  State<VechileCard> createState() => _VechileCardState();
}

class _VechileCardState extends State<VechileCard> {
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
    height = mediaHelper.percentHeigth(40);
    radius = Radius.circular(mediaHelper.bWidth(3));
    _innerBodyPaddding = EdgeInsets.symmetric(
      vertical: mediaHelper.bVertical(0.4),
      horizontal: mediaHelper.bHorizontal(4),
    );
    return InkWell(
      onTap: () => AppRoutes.router.push(AppRoutes.vehicle, extra: widget.vehicle),
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: height, minWidth: width),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VechileImage(vehicle: widget.vehicle),
            Container(
                width: double.infinity,
                color: Colors.grey.withOpacity(0.2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    VechilePrice(vehicle: widget.vehicle),
                    VechileMake(vehicle: widget.vehicle),
                    Padding(
                      padding: EdgeInsets.only(right: _innerBodyPaddding.right),
                      child: VechileYear(vehicle: widget.vehicle),
                    ),
                  ],
                )),
            Padding(
              padding: _innerBodyPaddding.copyWith(top: mediaHelper.bHeight(2)),
              child: Text(
                widget.vehicle.version,
                style: theme.textTheme.subtitle1,
              ),
            ),
            Padding(
              padding: _innerBodyPaddding,
              child: VechileMoreInfo(vehicle: widget.vehicle),
            ),
            Divider(height: mediaHelper.bHeight(10), thickness: 2),
          ],
        ),
      ),
    );
  }
}
