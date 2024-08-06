import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// Create shimmer effect when image still loading
/// Intended to be used inside Image.network 'loadingBuilder'
/// Please specify the height and width if the parent have unbound size
class ImageLoading extends StatelessWidget {
  const ImageLoading({super.key, this.backgroundColor, this.height, this.width});

  final Color? backgroundColor;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Container(
        height: height ?? double.infinity,
        width: width ?? double.infinity,
        color: backgroundColor ?? Colors.grey,
      ),
    );
  }
}

class CenterLoading extends StatelessWidget {
  const CenterLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}