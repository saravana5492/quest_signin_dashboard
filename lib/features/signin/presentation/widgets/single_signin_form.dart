import 'package:flutter/material.dart';
import 'package:quest_signin_dashboard/core/validator/email_validator.dart';
import 'package:quest_signin_dashboard/core/validator/password_validator.dart';
import 'package:quest_signin_dashboard/comman/widgets/app_form_field.dart';

class SingleSigninForm extends StatelessWidget {
  const SingleSigninForm({
    super.key,
    required this.singleSigninFormKey,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey singleSigninFormKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: singleSigninFormKey,
      child: Column(
        children: [
          const SizedBox(height: 16),
          AppFormField(
            controller: emailController,
            hintText: "Email*",
            keyboardType: TextInputType.emailAddress,
            validator: (value) => isValidEmail(value),
          ),
          const SizedBox(height: 16),
          AppFormField(
            controller: passwordController,
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
