import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../widgets/app_logo.dart';
import '../widgets/gradient_background.dart';
import '../widgets/three_dots_loader.dart';
import 'welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;
  late final Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _scale = Tween<double>(begin: 0.4, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );
    _fade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );
    _controller.forward();

    Future.delayed(const Duration(milliseconds: 3000), _goToWelcome);
  }

  void _goToWelcome() {
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 600),
        pageBuilder: (_, __, ___) => const WelcomeScreen(),
        transitionsBuilder: (_, animation, __, child) => FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: _scale,
                child: FadeTransition(
                  opacity: _fade,
                  child: const AppLogo(size: 140, glass: true),
                ),
              ),
              const SizedBox(height: 32),
              FadeTransition(
                opacity: _fade,
                child: const Text(
                  'وكالتي',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              FadeTransition(
                opacity: _fade,
                child: const Text(
                  'لتوزيع المواد الغذائية',
                  style: TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  ),
                ),
              ),
              const SizedBox(height: 60),
              const ThreeDotsLoader(),
            ],
          ),
        ),
      ),
    );
  }
}