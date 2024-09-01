import 'package:flutter/material.dart';

extension WidgetsExtension on List<Widget> {
  List<Widget> addSeparator(Widget separator, {bool applyToLast = false}) {
    final List<Widget> list = [];
    for (int i = 0; i < length; i++) {
      list.add(this[i]);
      if (i != length - 1 || applyToLast) list.add(separator);
    }
    return list;
  }
}

extension WidgetExtension on Widget {
  SizedBox sized({double? w, double? h}) => SizedBox(
    width: w,
    height: h,
    child: this,
  );

  Expanded expand({int flex = 1}) => Expanded(
    flex: flex,
    child: this,
  );

  Widget showWhen(bool condition, {Widget widgetReplacement = const SizedBox.shrink()}) {
    // return condition ? this : widgetReplacement;
    return Visibility(
      visible: condition,
      replacement: widgetReplacement,
      child: this,
    );
  }

  SafeArea safeArea() => SafeArea(child: this);

  Center center() => Center(child: this);

}
