import 'dart:math';
import 'package:flutter/material.dart';

class CountModel with ChangeNotifier {
  int _count = 0;
  // 初期色は赤
  Color _color = Colors.black; 

  int get count => _count;
  Color get color => _color;

  void incrementCounter() {
    _count++;
    notifyListeners();
  }

  void changeColor() {
    _color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    notifyListeners();
  }

  void resetCounter() {
    _count = 0;
    notifyListeners();
  }
}