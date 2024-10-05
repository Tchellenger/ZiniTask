import 'package:flutter/material.dart';
import 'package:zini_task/main.dart';

class MessageSync extends ChangeNotifier {
  bool _sync = isRunning;

  bool get isSync => _sync;

  set sync(bool newValue) {
    _sync = newValue;
    notifyListeners();
  }
}
