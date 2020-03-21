import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconPaddings {
  static EdgeInsets getEdgeInsets(IconData icon) {
    if (icon == Icons.warning) {
      return EdgeInsets.fromLTRB(5, 0, 5, 10);
    }
    return EdgeInsets.all(5);
  }
}