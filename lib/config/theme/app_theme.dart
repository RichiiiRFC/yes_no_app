import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF4500D8);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class AppTheme{

  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
}): assert(selectedColor >= 0 && selectedColor <= _colorThemes.length -1,
  "Colors must be between 0 and ${_colorThemes.length}");

  ThemeData theme(){
    return ThemeData(
        colorSchemeSeed: _colorThemes[selectedColor],
        //brightness: Brightness.dark
    );
  }
}