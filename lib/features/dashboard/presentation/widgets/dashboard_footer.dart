import 'package:flutter/material.dart';
import 'package:quest_signin_dashboard/core/config/app_color.dart';
import 'package:quest_signin_dashboard/core/config/app_textstyle.dart';
import 'package:quest_signin_dashboard/features/dashboard/domain/entities/careerpath.dart';

class DashboardFooter extends StatelessWidget {
  const DashboardFooter({
    super.key,
    required this.careerPath,
  });

  final CareerPath careerPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.black,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Start ${careerPath.currentLevelTitle}",
                  style: AppTextStyle.largeSemiBoldBodyStyle
                      .copyWith(color: AppColor.whiteColor),
                  maxLines: 2,
                ),
                const SizedBox(height: 4),
                Text(
                  careerPath.currentLevelDescription,
                  style: AppTextStyle.extraSmallSemiBoldBodyStyle
                      .copyWith(color: AppColor.whiteColor),
                  maxLines: 3,
                )
              ],
            ),
          ),
          const SizedBox(width: 24),
          Container(
            padding:
                const EdgeInsets.only(left: 20, top: 8, bottom: 8, right: 6),
            decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Text(
                  "Earn20",
                  style: AppTextStyle.largeSemiBoldBodyStyle
                      .copyWith(color: AppColor.primaryColor),
                ),
                const SizedBox(width: 6),
                const Icon(
                  Icons.add_circle_outline,
                  color: AppColor.primaryColor,
                  size: 24,
                ),
                const SizedBox(width: 6),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColor.primaryColor,
                  size: 24,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
