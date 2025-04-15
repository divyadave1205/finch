import 'package:finch/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GiveAwayContainer extends StatelessWidget {
  const GiveAwayContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 235.w,
      height: 230.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          image: DecorationImage(
            image: AssetImage('assets/images/png/give_away_bg.png'),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.black.withAlpha(0),
              AppColors.black,
            ],
          )),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Opacity(
              opacity: 0.5,
              child: Text(
                'get chance to win fantastic prizes by burning your yolo coin.',
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
