import 'package:fpdart/fpdart.dart';
import 'package:quest_signin_dashboard/core/error/failure.dart';
import 'package:quest_signin_dashboard/comman/usecase/usecase.dart';
import 'package:quest_signin_dashboard/features/signin/domain/entities/dual_user.dart';
import 'package:quest_signin_dashboard/features/signin/domain/repository/sigin_repository.dart';

class DualUserSignin implements UseCase<DualUser, DualUserSigninRequest> {
  final SigninRepository signinRepository;

  DualUserSignin({required this.signinRepository});

  @override
  Future<Either<Failure, DualUser>> call(DualUserSigninRequest params) {
    return signinRepository.dualUserSignin(
        userOneEmail: params.userOneEmail,
        userOnePassword: params.userOnePassword,
        userTwoEmail: params.userTwoEmail,
        userTwoPassword: params.userTwoPassword);
  }
}

class DualUserSigninRequest {
  final String userOneEmail;
  final String userOnePassword;
  final String userTwoEmail;
  final String userTwoPassword;

  DualUserSigninRequest({
    required this.userOneEmail,
    required this.userOnePassword,
    required this.userTwoEmail,
    required this.userTwoPassword,
  });
}
