part of 'signin_bloc.dart';

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {}

final class SigninLoading extends SigninState {}

final class SingleSigninSuccess extends SigninState {
  final User user;

  SingleSigninSuccess({required this.user});
}

final class DualSigninSuccess extends SigninState {
  final DualUser user;

  DualSigninSuccess({required this.user});
}

final class SigninFailure extends SigninState {
  final String errorMessage;

  SigninFailure({required this.errorMessage});
}
