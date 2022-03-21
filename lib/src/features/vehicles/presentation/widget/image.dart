import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/media_helpers.dart';
import '../../domain/entities/vehicle.dart';

class VechileImage extends StatelessWidget {
  const VechileImage({Key? key, required this.vehicle}) : super(key: key);

  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) {
    final mediaHelper = MediaHelper.of(context);
    return CachedNetworkImage(
      imageUrl: Uri.parse(vehicle.image).replace(scheme: 'https').toString(),
      placeholder: (context, url) => SizedBox(
        width: mediaHelper.bWidth(20),
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
      width: double.infinity,
    );
  }
}
