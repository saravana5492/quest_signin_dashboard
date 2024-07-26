import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quest_signin_dashboard/core/config/app_theme.dart';
import 'package:quest_signin_dashboard/features/signin/presentation/bloc/signin_bloc.dart';
import 'package:quest_signin_dashboard/features/signin/presentation/pages/siginin_page.dart';
import 'package:quest_signin_dashboard/init_dependencies.dart';

void main() {
  initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => serviceLocator<SigninBloc>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quest',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.lightTheme,
      home: const SigninPage(),
    );
  }
}
