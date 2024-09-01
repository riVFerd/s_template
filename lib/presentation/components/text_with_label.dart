import 'package:flutter/material.dart';
import 'package:s_template/common/extensions/context_extension.dart';

/// Useful for displaying a label and a text (ex: Profile screen)
class TextWithLabel extends StatelessWidget {
  final String label;
  final String text;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;
  final double? spacing;

  const TextWithLabel({super.key, required this.label, required this.text, this.labelStyle, this.textStyle, this.spacing});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: labelStyle ?? context.textTheme.labelMedium?.copyWith(
            color: context.colorScheme.secondary,
          ),
        ),
        SizedBox(height: spacing ?? 4),
        Text(text, style: textStyle ?? context.textTheme.titleLarge),
      ],
    );
  }
}
