import 'package:quest_signin_dashboard/features/signin/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
  });

  User toEntity() {
    return User(id: id, name: name, email: email);
  }
}
