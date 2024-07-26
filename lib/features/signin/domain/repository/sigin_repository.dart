import 'package:fpdart/fpdart.dart';
import 'package:quest_signin_dashboard/core/error/failure.dart';
import 'package:quest_signin_dashboard/features/signin/domain/entities/dual_user.dart';
import 'package:quest_signin_dashboard/features/signin/domain/entities/user.dart';

abstract interface class SigninRepository {
  Future<Either<Failure, User>> singleUserSignin({
    required String email,
    required String password,
  });

  Future<Either<Failure, DualUser>> dualUserSignin({
    required String userOneEmail,
    required String userOnePassword,
    required String userTwoEmail,
    required String userTwoPassword,
  });
}
