import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quest_signin_dashboard/comman/responsive/responsive.dart';
import 'package:quest_signin_dashboard/core/assets/app_vectors.dart';
import 'package:quest_signin_dashboard/core/config/app_color.dart';
import 'package:quest_signin_dashboard/core/config/app_textstyle.dart';
import 'package:quest_signin_dashboard/features/dashboard/domain/entities/careerpath.dart';

class DashboardCareerHeader extends StatelessWidget {
  const DashboardCareerHeader({
    super.key,
    required this.careerPath,
  });

  final CareerPath careerPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: EdgeInsets.symmetric(
          horizontal: Responsive.isMobile(context) ? 16 : 0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColor.borderColor, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(AppVector.careerPathImage),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(careerPath.title,
                      style: AppTextStyle.smallSemiBoldBodyStyle
                          .copyWith(color: AppColor.whiteColor)),
                ),
                const SizedBox(height: 8),
                Text(
                  careerPath.description,
                  style: AppTextStyle.largeSemiBoldBodyStyle,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
