import 'package:finch/core/constants/colors.dart';
import 'package:finch/core/widgets/custom_gradient_button.dart';
import 'package:finch/src/payment/view/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MembershipCard extends StatelessWidget {
  const MembershipCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328.w,
      height: 278.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColors.white.withAlpha(
          (0.2 * 255).toInt(),
        ),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: SvgPicture.asset(
              'assets/images/svg/card_bg.svg',
              fit: BoxFit.cover,
              width: 328.w,
              height: 278.h,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/svg/yolo.svg',
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20.h),
                Opacity(
                  opacity: 0.5,
                  child: Text(
                    '''To get started, pay the one-time fee for your instant digital card and enjoy the perks of membership today.''',
                    style: TextStyle(
                      color: AppColors.white,
                      fontFamily: 'Poppins',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 29.h),
                CustomGradientButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 400),
                        pageBuilder: (_, animation, secondaryAnimation) =>
                            const PaymentScreen(),
                        transitionsBuilder: (_, animation, __, child) {
                          const begin = Offset(0.0, 1.0);
                          const end = Offset.zero;
                          const curve = Curves.easeOut;

                          final tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: curve));
                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  text: "explore now",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
