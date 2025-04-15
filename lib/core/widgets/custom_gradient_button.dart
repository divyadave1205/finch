import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGradientButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final double borderRadius;
  final double height;
  final double width;
  final TextStyle? textStyle;

  const CustomGradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.borderRadius = 0,
    this.height = 53,
    this.width = double.infinity,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          height: height.h,
          width: width.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFBB0707), Color(0xFF7D1212)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Text(
            text,
            style: textStyle ??
                TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  fontFamily: 'Poppins',
                ),
          ),
        ),
      ),
    );
  }
}
