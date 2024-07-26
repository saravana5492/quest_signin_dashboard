import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quest_signin_dashboard/core/assets/app_images.dart';
import 'package:quest_signin_dashboard/core/config/app_color.dart';
import 'package:quest_signin_dashboard/core/config/app_textstyle.dart';
import 'package:quest_signin_dashboard/comman/responsive/responsive.dart';
import 'package:quest_signin_dashboard/core/utils/snackbar.dart';
import 'package:quest_signin_dashboard/comman/widgets/language_selection_button.dart';
import 'package:quest_signin_dashboard/features/dashboard/presentation/pages/bottom_navigationbar.dart';
import 'package:quest_signin_dashboard/features/signin/presentation/bloc/signin_bloc.dart';
import 'package:quest_signin_dashboard/features/signin/presentation/widgets/dual_signin_form.dart';
import 'package:quest_signin_dashboard/features/signin/presentation/widgets/main_siginin_form.dart';
import 'package:quest_signin_dashboard/features/signin/presentation/widgets/signin_bottom_buttons.dart';
import 'package:quest_signin_dashboard/features/signin/presentation/widgets/single_signin_form.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> with TickerProviderStateMixin {
  // Form Keys
  final _singleSigninFormKey = GlobalKey<FormState>();
  final _dualSigninFormKey = GlobalKey<FormState>();

  // Field controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _learner1EmailController = TextEditingController();
  final _learner1PasswordController = TextEditingController();
  final _learner2EmailController = TextEditingController();
  final _learner2PasswordController = TextEditingController();

  // Tab Controller
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void _singleSignin() {
    if (_singleSigninFormKey.currentState!.validate()) {
      context.read<SigninBloc>().add(
            SingleUserSigninEvent(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim(),
            ),
          );
    }
    return;
  }

  void _dualSignin() {
    if (_dualSigninFormKey.currentState!.validate()) {
      context.read<SigninBloc>().add(
            DualUserSigninEvent(
              userOneEmail: _learner1EmailController.text.trim(),
              userOnePassword: _learner1PasswordController.text.trim(),
              userTwoEmail: _learner2EmailController.text.trim(),
              userTwoPassword: _learner2PasswordController.text.trim(),
            ),
          );
    }
    return;
  }

  void _navigateToDashboard() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const MainBottomNavigationbar()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: Responsive.isMobile(context) ? true : false,
        title: Responsive.isMobile(context)
            ? const Text(
                "Login",
                style: AppTextStyle.mediumSemiBoldBodyStyle,
              )
            : Image.asset(AppImages.questLogo),
        backgroundColor: !Responsive.isMobile(context)
            ? AppColor.whiteColor
            : AppColor.backgroundColor,
        actions: const [LanguageSelectionButton()],
      ),
      body: BlocConsumer<SigninBloc, SigninState>(
        listener: (context, state) {
          if (state is SigninFailure) {
            showSnackBar(context, state.errorMessage);
          }

          if (state is SingleSigninSuccess || state is DualSigninSuccess) {
            _navigateToDashboard();
            _clearUserInputs();
          }
        },
        builder: (context, state) {
          if (state is SigninLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                if (Responsive.isMobile(context))
                  _mobileLayout()
                else
                  _desktopLayout(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _mainFormContainer() {
    return MainSigninForm(
      tabController: _tabController,
      signinPressed: (index) {
        if (index == 0) {
          _singleSignin();
        } else if (index == 1) {
          _dualSignin();
        }
      },
      singleSigninForm: SingleSigninForm(
        singleSigninFormKey: _singleSigninFormKey,
        emailController: _emailController,
        passwordController: _passwordController,
      ),
      dualSigninForm: DualSigninForm(
        dualSigninFormKey: _dualSigninFormKey,
        learner1EmailController: _learner1EmailController,
        learner1PasswordController: _learner1PasswordController,
        learner2EmailController: _learner2EmailController,
        learner2PasswordController: _learner2PasswordController,
      ),
      otpLoginPressed: () {
        _navigateToDashboard();
      },
    );
  }

  Widget _mobileLayout() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: _mainFormContainer(),
        ),
        const SizedBox(height: 20),
        const SigninBottomButtons(),
      ],
    );
  }

  Widget _desktopLayout() {
    return Column(
      children: [
        Container(
          width: 435,
          padding: const EdgeInsets.all(31),
          margin: const EdgeInsets.only(top: 24),
          decoration: BoxDecoration(
              color: AppColor.whiteColor,
              border: Border.all(color: AppColor.borderColor),
              borderRadius: BorderRadius.circular(24)),
          child: _mainFormContainer(),
        ),
        const SizedBox(height: 20),
        const SigninBottomButtons(),
      ],
    );
  }

  void _clearUserInputs() {
    _emailController.clear();
    _passwordController.clear();
    _learner1EmailController.clear();
    _learner1PasswordController.clear();
    _learner2EmailController.clear();
    _learner2PasswordController.clear();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _learner1EmailController.dispose();
    _learner1PasswordController.dispose();
    _learner2EmailController.dispose();
    _learner2PasswordController.dispose();
    _tabController.dispose();
  }
}
