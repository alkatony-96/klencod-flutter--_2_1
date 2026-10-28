import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class ThreeDotsLoader extends StatefulWidget {
  final Color color;
  final double dotSize;
  const ThreeDotsLoader({
    super.key,
    this.color = AppColors.primary,
    this.dotSize = 14,
  });

  @override
  State<ThreeDotsLoader> createState() => _ThreeDotsLoaderState();
}

class _ThreeDotsLoaderState extends State<ThreeDotsLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (i) {
            final phase = (_controller.value + i * 0.18) % 1.0;
            final wave = math.sin(phase * math.pi * 2);
            final translateY = -8.0 * math.max(0, wave);
            final scale = 0.85 + 0.15 * math.max(0, wave);

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Transform.translate(
                offset: Offset(0, translateY),
                child: Transform.scale(
                  scale: scale,
                  child: Container(
                    width: widget.dotSize,
                    height: widget.dotSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.color,
                      boxShadow: [
                        BoxShadow(
                          color: widget.color.withOpacity(0.6),
                          blurRadius: 12,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}