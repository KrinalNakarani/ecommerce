import 'package:ecommerce/apiclass/storeApi.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  bool isTheme = false;

  void Theme1(bool value) {
    isTheme = value;
    notifyListeners();
  }


}
