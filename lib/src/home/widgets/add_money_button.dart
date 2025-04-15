import 'dart:ui';

import 'package:finch/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class AddMoneyButton extends StatelessWidget {
  const AddMoneyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156.w,
      height: 70.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(430),
        color: AppColors.black,
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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/svg/plus.svg',
              fit: BoxFit.cover,
            ),
            SizedBox(width: 8.w),
            Text(
              'add money',
              style: TextStyle(
                color: AppColors.white,
                fontFamily: 'Poppins',
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
