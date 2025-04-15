// ignore_for_file: use_build_context_synchronously

import 'package:finch/core/constants/colors.dart';
import 'package:finch/src/payment/view/payment_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PaymentProcessingScreen extends StatefulWidget {
  final String amount;
  const PaymentProcessingScreen({super.key, required this.amount});

  @override
  State<PaymentProcessingScreen> createState() =>
      _PaymentProcessingScreenState();
}

class _PaymentProcessingScreenState extends State<PaymentProcessingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    navigate();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..repeat(reverse: false);
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  void navigate() async {
    await Future.delayed(const Duration(seconds: 2));

    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => PaymentSuccessScreen(
          amount: widget.amount,
        ),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildFlyingNote(double progress) {
    final double yOffset = 10 * (1 - (progress - 0.5).abs() * 2);

    return Positioned(
      left: 80 + (progress * 140),
      top: 300 - yOffset,
      child: Image.asset(
        'assets/images/png/money_note.png',
        width: 24.w,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/svg/red_wave.svg',
            height: 280.h,
          ),
          Positioned(
            left: 40.w,
            top: 300.h,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/png/user.png'),
              radius: 24,
            ),
          ),
          Positioned(
            right: 40.w,
            top: 300.h,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 24.sp,
              child: Text(
                'RM',
                style: TextStyle(
                  color: Color(0xFF7D1212),
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, _) {
              return Stack(
                children: List.generate(5, (i) {
                  final offset = i * 0.15;
                  double progress = (_animation.value + offset) % 1;
                  return _buildFlyingNote(progress);
                }),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 60.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "PAYMENT OF",
                    style: TextStyle(
                      color: Colors.white60,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Text(
                    "₹ ${widget.amount}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "has been made to riddhi mahalaxmi,\nplease wait for it to be completed",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white54,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
