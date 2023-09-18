import 'package:flutter/material.dart';

class RanaProvider extends ChangeNotifier {
  int number = 0;
  void Increment() {
    number++;
    notifyListeners();
  }
}
