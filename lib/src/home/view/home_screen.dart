import 'package:finch/core/constants/colors.dart';
import 'package:finch/core/widgets/custom_gradient_button.dart';
import 'package:finch/src/home/model/transaction_model.dart';
import 'package:finch/src/home/widgets/add_money_button.dart';
import 'package:finch/src/home/widgets/balance_card.dart';
import 'package:finch/src/home/widgets/ginnie_container.dart';
import 'package:finch/src/home/widgets/give_away_container.dart';
import 'package:finch/src/home/widgets/header.dart';
import 'package:finch/src/home/widgets/membership_card.dart';
import 'package:finch/src/home/widgets/round_button.dart';
import 'package:finch/src/home/widgets/scan_card.dart';
import 'package:finch/src/home/widgets/transaction_button.dart';
import 'package:finch/src/home/widgets/transaction_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TransactionModel> transactions = [
    TransactionModel(
      image: 'assets/images/svg/vector.svg',
      title: 'Transfers',
      spend: '45% of total spends',
      amount: '₹ 26,350',
    ),
    TransactionModel(
      image: 'assets/images/svg/cup.svg',
      title: 'Food & drinks',
      spend: '18% of total spends',
      amount: '₹ 10,299',
    ),
    TransactionModel(
      image: 'assets/images/svg/video.svg',
      title: 'Entertainment',
      spend: '12% of total spends',
      amount: '₹ 7,299',
    ),
    TransactionModel(
      image: 'assets/images/svg/category.svg',
      title: 'Miscellaneous',
      spend: '10% of total spends',
      amount: '₹ 5,528',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Header(),
                    SizedBox(height: 24.h),
                    Opacity(
                      opacity: 0.3,
                      child: Text(
                        "WELCOME BACK,",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                    Text(
                      Supabase.instance.client.auth.currentUser
                              ?.userMetadata?['name'] ??
                          "Donald John",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Opacity(
                      opacity: 0.5,
                      child: Text(
                        "we have great things planned for you",
                        style: TextStyle(
                          color: AppColors.white,
                          fontFamily: 'Poppins',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    MembershipCard(),
                    SizedBox(height: 24.h),
                    BalanceCard(),
                    SizedBox(height: 25.h),
                    Row(
                      children: [
                        ScanCard(),
                        Spacer(),
                        Column(
                          children: [
                            AddMoneyButton(),
                            SizedBox(height: 24.h),
                            Row(
                              children: [
                                RoundButton(
                                  image: 'assets/images/svg/card.svg',
                                  name: 'card details',
                                ),
                                SizedBox(width: 15.w),
                                RoundButton(
                                  image: 'assets/images/svg/menu.svg',
                                  name: 'view all',
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Divider(),
                    SizedBox(height: 60.h),
                    Opacity(
                      opacity: 0.3,
                      child: Text(
                        "Membership Features ",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "yolo membership has a\nvariety of features for you",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Opacity(
                      opacity: 0.5,
                      child: Text(
                        "Yolo memberships cost ₹499 a year for access to the premium features.",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          GinnieContainer(),
                          SizedBox(width: 16.w),
                          GiveAwayContainer(),
                        ],
                      ),
                    ),
                    SizedBox(height: 40.h),
                    CustomGradientButton(
                      onPressed: null,
                      text: "explore more",
                    ),
                    SizedBox(height: 70.h),
                    Row(
                      children: [
                        Opacity(
                          opacity: 0.5,
                          child: Text(
                            "Recent Transactions",
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          "view all",
                          style: TextStyle(
                            color: AppColors.red,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.red,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      children: [
                        TransactionButton(
                          isSpend: true,
                          amount: '₹ 8,009',
                          name: 'total spends',
                        ),
                        Spacer(),
                        TransactionButton(
                          isSpend: false,
                          amount: '₹ 56,009',
                          name: 'total credits',
                        ),
                      ],
                    ),
                    SizedBox(height: 32.h),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return TransactionRow(
                          amount: transactions[index].amount,
                          spend: transactions[index].spend,
                          title: transactions[index].title,
                          image: transactions[index].image,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Divider(),
                        );
                      },
                      itemCount: transactions.length,
                    ),
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  'assets/images/svg/path.svg',
                  fit: BoxFit.cover,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        SvgPicture.asset(
                          'assets/images/svg/home.svg',
                          fit: BoxFit.cover,
                          height: 41.h,
                          width: 41.w,
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          "home",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SvgPicture.asset(
                          'assets/images/svg/yolo_pay.svg',
                          fit: BoxFit.cover,
                          height: 51.h,
                          width: 51.w,
                        ),
                        SizedBox(height: 5.h),
                        Opacity(
                          opacity: 0.3,
                          child: Text(
                            "yolo pay",
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SvgPicture.asset(
                          'assets/images/svg/ginnie.svg',
                          fit: BoxFit.cover,
                          height: 41.h,
                          width: 41.w,
                        ),
                        SizedBox(height: 5.h),
                        Opacity(
                          opacity: 0.3,
                          child: Text(
                            "ginnie",
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
