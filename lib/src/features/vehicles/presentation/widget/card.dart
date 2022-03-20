import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/media_helpers.dart';
import '../../domain/entities/vehicle.dart';

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

    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: height, minWidth: width),
      child: Container(
        decoration: decoration,
        margin: EdgeInsets.symmetric(vertical: mediaHelper.bVertical(1), horizontal: mediaHelper.bHorizontal(2)),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                _image,
                Positioned(child: _price),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget get _image => CachedNetworkImage(
        imageUrl: Uri.parse(widget.vehicle.image).replace(scheme: 'https').toString(),
        placeholder: (context, url) => SizedBox(
          width: mediaHelper.bWidth(20),
          height: height * 0.50,
          child: const Center(child: CircularProgressIndicator()),
        ),
        errorWidget: (context, url, error) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Falha ao carregar imagem'),
            TextButton(onPressed: () {}, child: const Text('Tentar novamente'))
          ],
        ),
        fit: BoxFit.cover,
        width: width,
      );

  Widget get _price => Container(
        padding: EdgeInsets.symmetric(
          vertical: mediaHelper.bVertical(1),
          horizontal: mediaHelper.bHorizontal(1.2),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: radius, topRight: radius),
          color: theme.colorScheme.primary,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: theme.colorScheme.primary.withOpacity(0.3),
              blurRadius: 4,
              spreadRadius: 1,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Text(
          'R\$ ${widget.vehicle.price}',
          style: theme.textTheme.headline6 ??
              const TextStyle().merge(
                TextStyle(
                  color: theme.colorScheme.onPrimary,
                ),
              ),
        ),
      );

  get decoration => BoxDecoration(
        borderRadius: BorderRadius.all(radius),
        color: theme.scaffoldBackgroundColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: theme.colorScheme.primary.withOpacity(0.3),
            blurRadius: 4,
            spreadRadius: 1,
            offset: const Offset(0, 0),
          ),
        ],
      );
}
