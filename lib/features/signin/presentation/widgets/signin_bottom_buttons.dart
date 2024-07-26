import 'package:flutter/material.dart';
import 'package:quest_signin_dashboard/core/config/app_textstyle.dart';
import 'package:quest_signin_dashboard/comman/widgets/app_text_button.dart';

class SigninBottomButtons extends StatelessWidget {
  const SigninBottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("New User? ", style: AppTextStyle.smallRegularBodyStyle),
            AppTextButton(title: "Register", onPressed: () {}),
          ],
        ),
        const SizedBox(height: 12),
        AppTextButton(title: "Need Help?", onPressed: () {}),
        const SizedBox(height: 16),
      ],
    );
  }
}
