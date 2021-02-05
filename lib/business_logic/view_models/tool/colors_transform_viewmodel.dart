import 'package:flutter/material.dart';

class ColorsTransformViewModel extends ChangeNotifier {
  int _colorData;

  int get colorData => _colorData;

  set colorData(int val) {
    _colorData = val;
    notifyListeners();
  }

  void getColor(int model, String color) {
    notifyListeners();
  }

  String getNumber(String number,int mode){
    if(mode==0){
      int n=int.tryParse(number);
      if(n>255||n<0){
        return "";
      }
      return int.tryParse(number,radix: 16).toString();
    }else{
      int n=int.tryParse(number,radix: 16);
      if(n>255||n<0){
        return "";
      }
      return int.tryParse(number,radix: 10).toString();
    }
  }
}
