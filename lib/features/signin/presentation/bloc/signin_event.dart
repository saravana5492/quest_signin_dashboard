part of 'signin_bloc.dart';

@immutable
sealed class SigninEvent {}

final class SingleUserSigninEvent extends SigninEvent {
  final String email;
  final String password;

  SingleUserSigninEvent({
    required this.email,
    required this.password,
  });
}

final class DualUserSigninEvent extends SigninEvent {
  final String userOneEmail;
  final String userOnePassword;
  final String userTwoEmail;
  final String userTwoPassword;

  DualUserSigninEvent({
    required this.userOneEmail,
    required this.userOnePassword,
    required this.userTwoEmail,
    required this.userTwoPassword,
  });
}
