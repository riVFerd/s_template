import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.height = 1,
    this.width = 1,
    this.color = Colors.grey,
    this.verticalMargin = 0,
    this.horizontalMargin = 0,
  });

  final double height;
  final double width;
  final Color color;
  final double verticalMargin;
  final double horizontalMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: verticalMargin, horizontal: horizontalMargin),
      height: height,
      width: width,
      color: color,
    );
  }
}