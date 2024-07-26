import 'package:quest_signin_dashboard/features/signin/data/model/dual_user_model.dart';
import 'package:quest_signin_dashboard/features/signin/data/model/user_model.dart';
import 'package:uuid/uuid.dart';

abstract interface class SigninRemoteDatasource {
  Future<UserModel> singleUserSignin({
    required String email,
    required String password,
  });

  Future<DualUserModel> dualUserSignin({
    required String userOneEmail,
    required String userOnePassword,
    required String userTwoEmail,
    required String userTwoPassword,
  });
}

class SigninRemoteDatasourceImpl implements SigninRemoteDatasource {
  @override
  Future<DualUserModel> dualUserSignin({
    required String userOneEmail,
    required String userOnePassword,
    required String userTwoEmail,
    required String userTwoPassword,
  }) async {
    await Future.delayed(const Duration(seconds: 3));
    var uuid = const Uuid();
    return DualUserModel(
      userOneId: uuid.v1(),
      userOneName: "questUserOne",
      userOneEmail: "userOne@gmail.com",
      userTwoId: uuid.v1(),
      userTwoName: "questUserTwo",
      userTwoEmail: "userTwo@gmail.com",
    );
  }

  @override
  Future<UserModel> singleUserSignin({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 3));
    var uuid = const Uuid();
    return UserModel(
      id: uuid.v1(),
      name: "Unique User",
      email: "questUser@gmail.com",
    );
  }
}
