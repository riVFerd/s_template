import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Utils {
  static bool isDarkMode() {
    final brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    return brightness == Brightness.dark;
  }
}
