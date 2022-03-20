import 'package:flutter/material.dart';

class MediaHelper {
  MediaHelper._(BuildContext context) {
    _mediaQuery = MediaQuery.of(context);
    width = _mediaQuery.size.width;
    height = _mediaQuery.size.height;
    _bSizeWidth = width / 100;
    _bSizeHeight = height / 100;
  }

  late final double width;
  late final double height;
  late final double _bSizeWidth;
  late final double _bSizeHeight;
  late MediaQueryData _mediaQuery;

  double percentWidth(
    double percent, {
    double min = 0,
    double max = double.maxFinite,
  }) {
    final value = width * (percent / 100);
    if (value > max) {
      return max;
    }
    if (value < min) {
      return min;
    }
    return value;
  }

  double percentHeigth(
    double percent, {
    double min = 0,
    double max = double.maxFinite,
  }) {
    final value = height * (percent / 100);
    if (value > max) {
      return max;
    }
    if (value < min) {
      return min;
    }
    return value;
  }

  double bWidth(double blocks) => _bSizeWidth * blocks;
  double bHeight(double blocks) => _bSizeHeight * blocks;
  double bHorizontal(double blocks) => bWidth(blocks);
  double bVertical(double blocks) => bHeight(blocks);

  static MediaHelper of(BuildContext context) => MediaHelper._(context);
}
