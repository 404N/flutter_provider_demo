import 'package:flutter/material.dart';

class ColorsTransformViewModel extends ChangeNotifier {
  int _colorData;

  int get colorData => _colorData;

  set colorData(int val) {
    _colorData = val;
    notifyListeners();
  }

  void getColor(int model,String color){
    notifyListeners();
  }
}
