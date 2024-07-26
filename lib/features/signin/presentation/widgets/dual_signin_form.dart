import 'package:flutter/material.dart';
import 'package:quest_signin_dashboard/core/config/app_textstyle.dart';
import 'package:quest_signin_dashboard/core/validator/email_validator.dart';
import 'package:quest_signin_dashboard/core/validator/password_validator.dart';
import 'package:quest_signin_dashboard/comman/widgets/app_form_field.dart';

class DualSigninForm extends StatelessWidget {
  const DualSigninForm({
    super.key,
    required this.dualSigninFormKey,
    required this.learner1EmailController,
    required this.learner1PasswordController,
    required this.learner2EmailController,
    required this.learner2PasswordController,
  });

  final GlobalKey dualSigninFormKey;
  final TextEditingController learner1EmailController;
  final TextEditingController learner1PasswordController;
  final TextEditingController learner2EmailController;
  final TextEditingController learner2PasswordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: dualSigninFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const Text(
            "Learner 1",
            style: AppTextStyle.mediumRegularBodyStyle,
          ),
          const SizedBox(height: 8),
          AppFormField(
            controller: learner1EmailController,
            hintText: "Email*",
            keyboardType: TextInputType.emailAddress,
            validator: (value) => isValidEmail(value),
          ),
          const SizedBox(height: 16),
          AppFormField(
            controller: learner1PasswordController,
            hintText: "Password*",
            obscureText: true,
            validator: (value) => isValidPassword(value),
          ),
          const SizedBox(height: 20),
          const Text(
            "Learner 2",
            style: AppTextStyle.mediumRegularBodyStyle,
          ),
          const SizedBox(height: 8),
          AppFormField(
            controller: learner2EmailController,
            hintText: "Email*",
            keyboardType: TextInputType.emailAddress,
            validator: (value) => isValidEmail(value),
          ),
          const SizedBox(height: 16),
          AppFormField(
            controller: learner2PasswordController,
            hintText: "Password*",
            obscureText: true,
            validator: (value) => isValidPassword(value),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
