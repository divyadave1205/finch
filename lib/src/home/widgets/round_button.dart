import 'package:finch/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class RoundButton extends StatelessWidget {
  final String image;
  final String name;
  const RoundButton({
    super.key,
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70.w,
          height: 70.h,
          decoration: BoxDecoration(
            color: AppColors.black,
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
          ),
          child: Center(
            child: SvgPicture.asset(
              image,
              fit: BoxFit.cover,
              height: 20.h,
              width: 20.w,
            ),
          ),
        ),
        SizedBox(width: 7.h),
        Text(
          name,
          style: TextStyle(
            color: AppColors.white,
            fontFamily: 'Poppins',
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
