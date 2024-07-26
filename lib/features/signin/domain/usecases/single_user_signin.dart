import 'package:fpdart/fpdart.dart';
import 'package:quest_signin_dashboard/core/error/failure.dart';
import 'package:quest_signin_dashboard/comman/usecase/usecase.dart';
import 'package:quest_signin_dashboard/features/signin/domain/entities/user.dart';
import 'package:quest_signin_dashboard/features/signin/domain/repository/sigin_repository.dart';

class SingleUserSignin implements UseCase<User, SingleSigninRequest> {
  final SigninRepository signinRepository;

  SingleUserSignin({required this.signinRepository});

  @override
  Future<Either<Failure, User>> call(SingleSigninRequest params) {
    return signinRepository.singleUserSignin(
      email: params.email,
      password: params.password,
    );
  }
}

class SingleSigninRequest {
  final String email;
  final String password;

  SingleSigninRequest({required this.email, required this.password});
}
