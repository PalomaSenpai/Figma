import 'package:flutter/material.dart';

class GlobalValues {
  static ValueNotifier isValidating = ValueNotifier(false);
  static ValueNotifier<ThemeData> themeApp = ValueNotifier(ThemeData.light());
  static ValueNotifier<String> fontFamily = ValueNotifier('Roboto');
}