import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quest_signin_dashboard/features/signin/domain/entities/dual_user.dart';
import 'package:quest_signin_dashboard/features/signin/domain/entities/user.dart';
import 'package:quest_signin_dashboard/features/signin/domain/usecases/dual_user_signin.dart';
import 'package:quest_signin_dashboard/features/signin/domain/usecases/single_user_signin.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final SingleUserSignin _singleUserSignin;
  final DualUserSignin _dualUserSignin;

  SigninBloc({
    required SingleUserSignin singleUserSignin,
    required DualUserSignin dualUserSignin,
  })  : _singleUserSignin = singleUserSignin,
        _dualUserSignin = dualUserSignin,
        super(SigninInitial()) {
    on<SigninEvent>((_, emit) => emit(SigninLoading()));
    on<SingleUserSigninEvent>(_singleSignin);
    on<DualUserSigninEvent>(_dualSignin);
  }

  void _singleSignin(
    SingleUserSigninEvent event,
    Emitter<SigninState> emit,
  ) async {
    final response = await _singleUserSignin(SingleSigninRequest(
      email: event.email,
      password: event.password,
    ));
    response.fold(
      (failure) => emit(SigninFailure(errorMessage: failure.message)),
      (user) => emit(SingleSigninSuccess(user: user)),
    );
  }

  void _dualSignin(DualUserSigninEvent event, Emitter<SigninState> emit) async {
    final response = await _dualUserSignin(DualUserSigninRequest(
      userOneEmail: event.userOneEmail,
      userOnePassword: event.userOnePassword,
      userTwoEmail: event.userTwoEmail,
      userTwoPassword: event.userTwoPassword,
    ));
    response.fold(
      (failure) => emit(SigninFailure(errorMessage: failure.message)),
      (dualUser) => emit(DualSigninSuccess(user: dualUser)),
    );
  }
}
