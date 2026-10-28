import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;
  const GradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.backgroundDark,
            AppColors.backgroundMid,
            AppColors.backgroundLight,
          ],
          stops: [0.0, 0.55, 1.0],
        ),
      ),
      child: Stack(
        children: [
          // بقعة برتقالية علوية
          Positioned(
            top: -size.height * 0.15,
            right: -size.width * 0.25,
            child: Container(
              width: size.width * 0.9,
              height: size.width * 0.9,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.primary.withOpacity(0.35),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          // بقعة برتقالية سفلية
          Positioned(
            bottom: -size.height * 0.2,
            left: -size.width * 0.3,
            child: Container(
              width: size.width,
              height: size.width,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.primaryLight.withOpacity(0.18),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          // بقعة وسطية ناعمة
          Positioned(
            top: size.height * 0.35,
            left: size.width * 0.4,
            child: Container(
              width: size.width * 0.5,
              height: size.width * 0.5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.primaryDark.withOpacity(0.15),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          // المحتوى
          child,
        ],
      ),
    );
  }
}