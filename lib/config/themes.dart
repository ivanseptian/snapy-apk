import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:markaz_snappy/config/config.dart';
import 'package:markaz_snappy/utils/utils.dart';

ThemeData appTheme = createTheme(
  brightness: Brightness.light,
  systemOverlayStyle: SystemUiOverlayStyle.dark,
  primarySwatch: ColorsValue.primarySwatch,
  background: ColorsValue.backgroundColor,
  primaryText: Colors.black,
  secondaryText: Colors.white,
  accentColor: ColorsValue.secondaryColor,
  divider: ColorsValue.secondaryColor,
  buttonBackground: Colors.black38,
  buttonText: ColorsValue.secondaryColor,
  disabled: ColorsValue.secondaryColor,
  error: Colors.red,
);