import 'package:finch/core/constants/colors.dart';
import 'package:finch/src/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class FinalPaymentScreen extends StatefulWidget {
  final String amount;
  const FinalPaymentScreen({super.key, required this.amount});

  @override
  State<FinalPaymentScreen> createState() => _FinalPaymentScreenState();
}

class _FinalPaymentScreenState extends State<FinalPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff229642).withAlpha((0.4 * 255).toInt()),
                  Color(0xff0D0D0D).withAlpha(0),
                ],
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12),
                  child: Row(
                    spacing: 8.w,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
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
                        },
                        child: Icon(Icons.close, color: Colors.white),
                      ),
                      Spacer(),
                      Icon(Icons.share_outlined, color: Colors.white),
                      Icon(Icons.more_horiz, color: Colors.white),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30.h),
                      child: Container(
                        width: 169.w,
                        height: 169.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: GradientBoxBorder(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColors.white,
                                AppColors.white.withAlpha(0),
                              ],
                            ),
                            width: 1,
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xff229642),
                              Color(0xff0D0D0D).withAlpha(0)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 70.h,
                          width: 76.w,
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.transparent,
                            border: GradientBoxBorder(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  AppColors.white,
                                  AppColors.white.withAlpha(0),
                                ],
                              ),
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Container(
                              height: 50.h,
                              width: 60.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColors.white,
                              ),
                              child: Center(
                                child: Text(
                                  'RM',
                                  style: TextStyle(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff229642),
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Opacity(
                          opacity: 0.2,
                          child: Text(
                            'PAID SUCCESSFULLY TO',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          'Riddhi Mahalaxmi',
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '₹ ${widget.amount}',
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Opacity(
                          opacity: 0.5,
                          child: Text(
                            '11th Jun, 2023 at 12:05 PM\nupi transaction ID: 54732653244',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          'view details',
                          style: TextStyle(
                            fontSize: 14.sp,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 43.h),
                Container(
                  width: 248.w,
                  height: 288.h,
                  padding: EdgeInsets.all(19),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    border: GradientBoxBorder(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.white.withAlpha((0.3 * 255).toInt()),
                          AppColors.white.withAlpha(0),
                        ],
                      ),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/images/svg/coin.svg',
                      ),
                      Opacity(
                        opacity: 0.2,
                        child: Text(
                          'CONGRATULATIONS',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 162.w,
                        child: Text.rich(
                          textAlign: TextAlign.center,
                          TextSpan(
                            text: 'you have earned ',
                            children: [
                              TextSpan(
                                text: widget.amount,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.green,
                                ),
                              ),
                              TextSpan(
                                text: ' yolo coins',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 21.h),
                      Text(
                        'check yolo coin balance',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          color: AppColors.red,
                          decorationColor: AppColors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
