import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  FocusScopeNode get focus => FocusScope.of(this);
}

extension IntExt on int {
  SizedBox get sizedWidth => SizedBox(width: toDouble());
  SizedBox get sizedHeight => SizedBox(height: toDouble());
}

extension DoubleExt on double {
  SizedBox get sizedWidth => SizedBox(width: this);
  SizedBox get sizeHeight => SizedBox(height: this);
}
