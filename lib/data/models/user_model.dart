import 'package:home_automation_control/domain/entities/response/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required String id,
    required String username,
    required String email,
  }) : super(
          id: id,
          username: username,
          email: email,
        );

  factory UserModel.fromMap(Map<String, dynamic> res) {
    return UserModel(
      id: res['id'].toString(),
      username: res['username'].toString(),
      email: res['email'] as String,
    );
  }
}
