import 'package:flutter/material.dart';

class LoadingVechiles extends StatelessWidget {
  const LoadingVechiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Center(child: CircularProgressIndicator()),
      );
}
