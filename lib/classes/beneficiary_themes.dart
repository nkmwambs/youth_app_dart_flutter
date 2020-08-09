import 'package:flutter/cupertino.dart';

class BeneficiaryThemes{

  final int theme_id;
  final String themeName;
  final String themeDescription;
  final String leadingThemeImage;
  final String maxGoalsForTheme;

  BeneficiaryThemes({
    @required this.theme_id,
    @required this.themeName,
    @required this.themeDescription, 
    @required this.leadingThemeImage,
    @required this.maxGoalsForTheme});

  
}