import 'package:flutter/material.dart';
import 'package:quest_signin_dashboard/core/config/app_color.dart';
import 'package:quest_signin_dashboard/core/config/app_textstyle.dart';

class AppBorderedButton extends StatelessWidget {
  const AppBorderedButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.icon,
  });
  final String title;
  final VoidCallback onPressed;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 48.0,
        child: TextButton.icon(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            side: const BorderSide(color: AppColor.primaryColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
          ),
          label: Text(
            title,
            style: AppTextStyle.largeSemiBoldBodyStyle
                .copyWith(color: AppColor.primaryColor),
          ),
          icon: icon,
        ));
  }
}
