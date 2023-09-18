import 'package:flutter/material.dart';

class IncrementProvider extends ChangeNotifier {
  int number = 0;
  void Increment() {
    number++;
    notifyListeners();
  }
}
