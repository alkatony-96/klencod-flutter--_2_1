import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import 'glass_container.dart';

class AppLogo extends StatelessWidget {
  final double size;
  final bool glass;
  const AppLogo({super.key, this.size = 100, this.glass = false});

  @override
  Widget build(BuildContext context) {
    final core = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primary, AppColors.primaryDark],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.5),
            blurRadius: 32,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Icon(
        Icons.shopping_basket_rounded,
        color: Colors.white,
        size: size * 0.5,
      ),
    );

    if (!glass) return core;

    return GlassContainer(
      borderRadius: size / 2 + 14,
      padding: const EdgeInsets.all(14),
      blur: 20,
      child: core,
    );
  }
}