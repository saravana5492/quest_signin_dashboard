import 'package:fpdart/fpdart.dart';
import 'package:quest_signin_dashboard/core/error/failure.dart';
import 'package:quest_signin_dashboard/features/signin/data/datasource/remote_datasource.dart';
import 'package:quest_signin_dashboard/features/signin/domain/entities/dual_user.dart';
import 'package:quest_signin_dashboard/features/signin/domain/entities/user.dart';
import 'package:quest_signin_dashboard/features/signin/domain/repository/sigin_repository.dart';

class SigninRepositoryImpl implements SigninRepository {
  final SigninRemoteDatasource signinRemoteDatasource;
  SigninRepositoryImpl({required this.signinRemoteDatasource});

  @override
  Future<Either<Failure, DualUser>> dualUserSignin({
    required String userOneEmail,
    required String userOnePassword,
    required String userTwoEmail,
    required String userTwoPassword,
  }) async {
    try {
      final user = await signinRemoteDatasource.dualUserSignin(
          userOneEmail: userOneEmail,
          userOnePassword: userOnePassword,
          userTwoEmail: userTwoEmail,
          userTwoPassword: userTwoPassword);
      return right(user);
    } catch (err) {
      return left(Failure(err.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> singleUserSignin({
    required String email,
    required String password,
  }) async {
    try {
      final user = await signinRemoteDatasource.singleUserSignin(
          email: email, password: password);
      return right(user);
    } catch (err) {
      return left(Failure(err.toString()));
    }
  }
}
