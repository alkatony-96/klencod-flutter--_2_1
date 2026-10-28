import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import 'glass_container.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool outlined;
  final IconData? icon;
  final double height;

  const PrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.outlined = false,
    this.icon,
    this.height = 58,
  });

  @override
  Widget build(BuildContext context) {
    final content = isLoading
        ? SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              valueColor: AlwaysStoppedAnimation(
                outlined ? AppColors.primary : Colors.white,
              ),
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  color: outlined ? AppColors.primary : Colors.white,
                  size: 20,
                ),
                const SizedBox(width: 10),
              ],
              Text(
                label,
                style: TextStyle(
                  color: outlined ? AppColors.primary : Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.2,
                ),
              ),
            ],
          );

    if (outlined) {
      return SizedBox(
        height: height,
        width: double.infinity,
        child: GlassContainer(
          borderRadius: 18,
          blur: 20,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: isLoading ? null : onPressed,
              borderRadius: BorderRadius.circular(18),
              child: Center(child: content),
            ),
          ),
        ),
      );
    }

    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [AppColors.primary, AppColors.primaryDark],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.4),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isLoading ? null : onPressed,
          borderRadius: BorderRadius.circular(18),
          child: Center(child: content),
        ),
      ),
    );
  }
}