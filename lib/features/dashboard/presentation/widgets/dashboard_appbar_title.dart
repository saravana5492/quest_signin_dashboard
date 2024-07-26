import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quest_signin_dashboard/core/assets/app_images.dart';
import 'package:quest_signin_dashboard/core/config/app_color.dart';
import 'package:quest_signin_dashboard/core/config/app_textstyle.dart';

class DashboardAppbarTitle extends StatelessWidget {
  const DashboardAppbarTitle({
    super.key,
    this.completedPercentage = 0,
  });

  final int completedPercentage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircularPercentIndicator(
          radius: 24.0,
          startAngle: 0,
          lineWidth: 3.0,
          percent: completedPercentage / 100,
          center: Image.asset(AppImages.tigerImage, width: 32),
          progressColor: AppColor.primaryColor,
        ),
        const SizedBox(width: 12),
        Text(
          '$completedPercentage% Completed',
          style: AppTextStyle.mediumSemiBoldBodyStyle,
        )
      ],
    );
  }
}
