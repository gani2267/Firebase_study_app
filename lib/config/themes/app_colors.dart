import 'package:firebase_study_app/config/themes/app_dark_theme.dart';
import 'package:firebase_study_app/config/themes/app_light_theme.dart';
import 'package:firebase_study_app/config/themes/ui_parameters.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


const Color onSurfaceTextColor = Colors.white;

const mainGradientLight = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    primaryLightColorLight,
    primaryColorLight
  ]
);

const mainGradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      primaryDarkColorDark,
      primaryColorDark
    ]
);

LinearGradient mainGradient(BuildContext context)=>
  UIParameters.isDarkMode()? mainGradientDark : mainGradientLight;


Color customScaffoldColor(BuildContext context) =>
    UIParameters.isDarkMode()? const Color(0xFF2e3c62)
        : const Color.fromARGB(255, 240, 237, 255);