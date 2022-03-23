import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../config/themes/app_theme.dart';

part 'theme.g.dart';

@singleton
class ThemeController = ThemeControllerBase with _$ThemeController;

abstract class ThemeControllerBase with Store {
  ThemeControllerBase();

  final themes = {
    Brightness.light: 'Tema Claro',
    Brightness.dark: 'Tema Escuro',
  };

  @observable
  Brightness brightness = Brightness.light;

  @computed
  ThemeData get themeData => isDarkMode ? AppTheme.dark : AppTheme.light;

  @computed
  bool get isDarkMode => brightness == Brightness.dark;

  void init(Brightness brightness) {
    this.brightness = brightness;
  }

  @action
  void change(Brightness brightness) {
    this.brightness = brightness;
  }
}
