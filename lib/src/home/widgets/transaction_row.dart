import 'package:finch/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class TransactionRow extends StatelessWidget {
  final String amount;
  final String spend;
  final String title;
  final String image;
  const TransactionRow({
    super.key,
    required this.amount,
    required this.title,
    required this.image,
    required this.spend,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 67.w,
          height: 60.h,
          decoration: BoxDecoration(
            color: AppColors.black,
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
          child: Center(
            child: SvgPicture.asset(
              image,
              height: 24.h,
              width: 24.w,
            ),
          ),
        ),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 8.h),
            Opacity(
              opacity: 0.5,
              child: Text(
                spend,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ],
        ),
        Spacer(),
        Text(
          amount,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}
