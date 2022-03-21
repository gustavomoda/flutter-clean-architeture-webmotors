// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ThemeController on ThemeControllerBase, Store {
  Computed<ThemeData>? _$themeDataComputed;

  @override
  ThemeData get themeData =>
      (_$themeDataComputed ??= Computed<ThemeData>(() => super.themeData,
              name: 'ThemeControllerBase.themeData'))
          .value;
  Computed<bool>? _$isDarkModeComputed;

  @override
  bool get isDarkMode =>
      (_$isDarkModeComputed ??= Computed<bool>(() => super.isDarkMode,
              name: 'ThemeControllerBase.isDarkMode'))
          .value;

  final _$brightnessAtom = Atom(name: 'ThemeControllerBase.brightness');

  @override
  Brightness get brightness {
    _$brightnessAtom.reportRead();
    return super.brightness;
  }

  @override
  set brightness(Brightness value) {
    _$brightnessAtom.reportWrite(value, super.brightness, () {
      super.brightness = value;
    });
  }

  final _$ThemeControllerBaseActionController =
      ActionController(name: 'ThemeControllerBase');

  @override
  void change(Brightness brightness) {
    final _$actionInfo = _$ThemeControllerBaseActionController.startAction(
        name: 'ThemeControllerBase.change');
    try {
      return super.change(brightness);
    } finally {
      _$ThemeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
brightness: ${brightness},
themeData: ${themeData},
isDarkMode: ${isDarkMode}
    ''';
  }
}
