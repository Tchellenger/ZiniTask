import 'package:flutter/material.dart';

class MessageSync extends ChangeNotifier {
  bool _sync = false;

  bool get isSync => _sync;

  set sync(bool newValue) {
    _sync = newValue;
    notifyListeners();
  }
}
