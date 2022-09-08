import 'package:firebase_study_app/config/themes/ui_parameters.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

TextStyle cardTitles(context) => TextStyle(
  fontWeight: FontWeight.bold,
  color: UIParameters.isDarkMode()?
  Theme.of(context).textTheme.bodyText1!.color:
  Theme.of(context).primaryColor,
  fontSize: 18,
);

const detailText = TextStyle(fontSize: 12);
const headerText = TextStyle(fontSize: 22,fontWeight: FontWeight.w700,
color: onSurfaceTextColor);