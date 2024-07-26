import 'package:flutter/material.dart';
import 'package:quest_signin_dashboard/core/config/app_color.dart';

class AppFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?) validator;

  const AppFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.name,
    this.obscureText = false,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColor.textColor,
      obscureText: obscureText,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      validator: validator,
    );
  }
}
