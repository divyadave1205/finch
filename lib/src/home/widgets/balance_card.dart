import 'dart:ui';

import 'package:finch/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328.w,
      height: 307.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: SvgPicture.asset(
              'assets/images/svg/balance_card_bg.svg',
              fit: BoxFit.cover,
              width: 328.w,
              height: 307.h,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/images/svg/yolo_logo.svg',
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20.h),
                Opacity(
                  opacity: 0.5,
                  child: Text(
                    'Monthly limit: ₹10,000 \nPer transaction limit: ₹2,000',
                    style: TextStyle(
                      color: AppColors.white,
                      fontFamily: 'Poppins',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 22.h),
                Divider(),
                SizedBox(height: 25.h),
                Opacity(
                  opacity: 0.5,
                  child: Text(
                    'balance available',
                    style: TextStyle(
                      color: AppColors.white,
                      fontFamily: 'Poppins',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Row(
                  spacing: 8.w,
                  children: [
                    Text(
                      '₹',
                      style: TextStyle(
                        color: AppColors.white,
                        fontFamily: 'Poppins',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '****',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w600,
                        foreground: Paint()
                          ..shader = LinearGradient(
                            colors: [
                              AppColors.white,
                              AppColors.white.withAlpha(0),
                            ],
                          ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/images/svg/hide.svg',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      height: 53.h,
                      margin: EdgeInsets.all(2),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: GradientBoxBorder(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.white.withAlpha((0.2 * 255).toInt()),
                              AppColors.white.withAlpha(0),
                            ],
                          ),
                          width: 1,
                        ),
                        color: AppColors.white.withAlpha((0.05 * 255).toInt()),
                      ),
                      child: Row(
                        spacing: 8.w,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/svg/card.svg',
                            fit: BoxFit.cover,
                          ),
                          Text(
                            'order physical card',
                            style: TextStyle(
                              color: AppColors.white,
                              fontFamily: 'Poppins',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: AppColors.white,
                            size: 20.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
