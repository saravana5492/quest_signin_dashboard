import 'package:flutter/material.dart';
import 'package:quest_signin_dashboard/core/config/app_color.dart';
import 'package:quest_signin_dashboard/core/config/app_textstyle.dart';
import 'package:quest_signin_dashboard/comman/responsive/responsive.dart';
import 'package:quest_signin_dashboard/comman/widgets/app_bordered_button.dart';
import 'package:quest_signin_dashboard/comman/widgets/app_filled_button.dart';
import 'package:quest_signin_dashboard/features/signin/presentation/widgets/dual_signin_form.dart';
import 'package:quest_signin_dashboard/features/signin/presentation/widgets/single_signin_form.dart';

class MainSigninForm extends StatefulWidget {
  const MainSigninForm({
    super.key,
    required this.tabController,
    required this.signinPressed,
    required this.singleSigninForm,
    required this.dualSigninForm,
    required this.otpLoginPressed,
  });

  final TabController tabController;
  final void Function(int) signinPressed;
  final SingleSigninForm singleSigninForm;
  final DualSigninForm dualSigninForm;
  final VoidCallback otpLoginPressed;

  @override
  State<MainSigninForm> createState() => _MainSigninFormState();
}

class _MainSigninFormState extends State<MainSigninForm> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!Responsive.isMobile(context))
          const Text(
            "Login to the Quest app",
            style: AppTextStyle.smallSemiBoldTitleStyle,
          ),
        const SizedBox(height: 24),
        TabBar(
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          indicatorColor: AppColor.textColor,
          indicatorWeight: 3,
          unselectedLabelColor: AppColor.hintTextColor,
          labelStyle: AppTextStyle.largeSemiBoldBodyStyle
              .copyWith(color: AppColor.textColor),
          controller: widget.tabController,
          tabs: const [
            Tab(text: "Single Login"),
            Tab(text: "Dual Login"),
          ],
        ),
        // Signle and dual Signin Form Content
        Builder(builder: (_) {
          if (_selectedIndex == 0) {
            return widget.singleSigninForm;
          } else if (_selectedIndex == 1) {
            return widget.dualSigninForm;
          } else {
            return Container();
          }
        }),
        // Login and other buttons
        AppFilledButton(
            title: "Login",
            onPressed: () => widget.signinPressed(_selectedIndex)),
        const SizedBox(height: 12),
        const Text(
          "or",
          style: AppTextStyle.largeRegularBodyStyle,
        ),
        const SizedBox(height: 12),
        AppBorderedButton(
          title: "Login with OTP instead",
          onPressed: widget.otpLoginPressed,
        ),
      ],
    );
  }
}
