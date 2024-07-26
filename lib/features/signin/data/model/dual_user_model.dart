import 'package:quest_signin_dashboard/features/signin/domain/entities/dual_user.dart';

class DualUserModel extends DualUser {
  DualUserModel({
    required super.userOneId,
    required super.userOneName,
    required super.userOneEmail,
    required super.userTwoId,
    required super.userTwoName,
    required super.userTwoEmail,
  });

  DualUser toEntity() {
    return DualUser(
      userOneId: userOneId,
      userOneName: userOneName,
      userOneEmail: userOneEmail,
      userTwoId: userTwoId,
      userTwoName: userTwoName,
      userTwoEmail: userTwoEmail,
    );
  }
}
