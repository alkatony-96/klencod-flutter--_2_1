import 'dart:ui';
import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double blur;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final Color? fillColor;
  final Border? border;
  final List<BoxShadow>? boxShadow;

  const GlassContainer({
    super.key,
    required this.child,
    this.blur = 24,
    this.borderRadius = 24,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.fillColor,
    this.border,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: boxShadow,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              color: fillColor ?? AppColors.glassFill,
              borderRadius: BorderRadius.circular(borderRadius),
              border: border ??
                  Border.all(color: AppColors.glassBorder, width: 1),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}