import 'package:flutter/material.dart';

class FilterProvider extends ChangeNotifier {
  double sliderValue = 0.0;

  List radioValues = ["az", "default"];
  String radioValue = "default";

  changeRadioValue(value) {
    radioValue = value;
    notifyListeners();
  }

  changeSliderValue(value) {
    sliderValue = value;
    notifyListeners();
  }
}
