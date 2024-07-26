import 'package:flutter/material.dart';
import 'package:quest_signin_dashboard/core/assets/app_images.dart';
import 'package:quest_signin_dashboard/core/config/app_color.dart';
import 'package:quest_signin_dashboard/core/config/app_textstyle.dart';

class UserPointsView extends StatelessWidget {
  const UserPointsView({
    super.key,
    this.pointImage = AppImages.points100Image,
    this.points = 100,
  });

  final String pointImage;
  final int points;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.borderColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Image.asset(pointImage, width: 20),
          const SizedBox(width: 4),
          Text('$points', style: AppTextStyle.largeSemiBoldBodyStyle),
        ],
      ),
    );
  }
}
