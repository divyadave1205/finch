// ignore_for_file: use_build_context_synchronously

import 'package:finch/core/constants/colors.dart';
import 'package:finch/src/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class PaymentFailScreen extends StatefulWidget {
  const PaymentFailScreen({super.key});

  @override
  State<PaymentFailScreen> createState() => _PaymentFailScreenState();
}

class _PaymentFailScreenState extends State<PaymentFailScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation1;
  late Animation<double> _animation2;

  @override
  void initState() {
    super.initState();
    navigate();
    navigate();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: false);

    _animation1 = Tween<double>(begin: 0.8, end: 1.6).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _animation2 = Tween<double>(begin: 1.0, end: 2.0).animate(
      CurvedAnimation(
          parent: _controller,
          curve: Interval(0.3, 1.0, curve: Curves.easeOut)),
    );
  }

  void navigate() async {
    await Future.delayed(const Duration(seconds: 4));

    Navigator.of(context).pushAndRemoveUntil(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const HomeScreen(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
      (route) => false,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildPulseCircle(double scale, double opacity) {
    return Transform.scale(
      scale: scale,
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff3E0C0C).withAlpha((0.3 * 255).toInt()),
              Color(0xff0D0D0D).withAlpha(0)
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, __) {
            return Stack(
              alignment: Alignment.center,
              children: [
                _buildPulseCircle(_animation2.value, 0.15),
                _buildPulseCircle(_animation1.value, 0.25),
                Container(
                  width: 140.w,
                  height: 140.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: GradientBoxBorder(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.white.withAlpha((0.2 * 255).toInt()),
                          AppColors.white.withAlpha(0),
                        ],
                      ),
                      width: 1,
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff3E0C0C).withAlpha((0.3 * 255).toInt()),
                        Color(0xff0D0D0D).withAlpha(0)
                      ],
                    ),
                  ),
                  child: const Icon(Icons.close, color: Colors.white, size: 36),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
