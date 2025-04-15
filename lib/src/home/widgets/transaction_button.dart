import 'package:finch/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionButton extends StatelessWidget {
  final bool isSpend;
  final String amount;
  final String name;
  const TransactionButton({
    super.key,
    required this.isSpend,
    required this.amount,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156.w,
      height: 56.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isSpend
              ? [
                  Color(0xFFBB0707),
                  Color(0xFF7D1212),
                ]
              : [
                  AppColors.black,
                  AppColors.black,
                ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              amount,
              style: TextStyle(
                color: AppColors.white,
                fontFamily: 'Poppins',
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 8.w),
            Opacity(
              opacity: 0.5,
              child: Text(
                name,
                style: TextStyle(
                  color: AppColors.white,
                  fontFamily: 'Poppins',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
