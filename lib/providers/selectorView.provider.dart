import 'package:flutter/material.dart';

class SelectorViewProvider with ChangeNotifier {
  static final SelectorViewProvider _singleton =
      SelectorViewProvider._internal();
  factory SelectorViewProvider() => _singleton;

  SelectorViewProvider._internal();

  bool isGridView = false;

  changeSelectorView(bool view) {
    isGridView = view;
    notifyListeners();
  }
}
