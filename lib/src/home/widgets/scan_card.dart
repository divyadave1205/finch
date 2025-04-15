import 'dart:ui';

import 'package:finch/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class ScanCard extends StatelessWidget {
  const ScanCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 148.w,
      height: 184.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
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
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: SvgPicture.asset(
              'assets/images/svg/scan_card_bg.svg',
              fit: BoxFit.cover,
              width: 148.w,
              height: 184.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 19, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  'assets/images/svg/scan.svg',
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20.h),
                Opacity(
                  opacity: 0.5,
                  child: Text(
                    'scan & pay',
                    style: TextStyle(
                      color: AppColors.white,
                      fontFamily: 'Poppins',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  'get rewards',
                  style: TextStyle(
                    color: AppColors.white,
                    fontFamily: 'Poppins',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
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
