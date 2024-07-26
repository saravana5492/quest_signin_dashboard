import 'package:flutter/material.dart';
import 'package:quest_signin_dashboard/core/config/app_color.dart';
import 'package:quest_signin_dashboard/core/config/app_textstyle.dart';

class LanguageSelectionButton extends StatelessWidget {
  const LanguageSelectionButton({
    super.key,
    this.items,
    this.buttonWidth = 55,
    // required this.valueChanged,
  });

  final List<DropdownMenuItem<String>>? items;
  final double buttonWidth;
  // final void Function(String?) valueChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: buttonWidth,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
            border: Border.all(color: AppColor.primaryColor),
            borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "EN",
              style: AppTextStyle.smallSemiBoldBodyStyle,
            ),
            SizedBox(width: 2),
            Icon(
              Icons.keyboard_arrow_down,
              color: AppColor.primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
