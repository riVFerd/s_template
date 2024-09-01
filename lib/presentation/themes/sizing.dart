import 'package:flutter/material.dart';

class Sizing {
  static const screenPadding = EdgeInsets.all(24);

  static const vSpacingSmall = SizedBox(height: 8);
  static const vSpacingMedium = SizedBox(height: 16);
  static const vSpacingLarge = SizedBox(height: 24);

  static const hSpacingSmall = SizedBox(width: 8);
  static const hSpacingMedium = SizedBox(width: 16);
  static const hSpacingLarge = SizedBox(width: 24);
}

/// Alias for [Sizing]
typedef Sz = Sizing;