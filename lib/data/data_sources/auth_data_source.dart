import 'package:home_automation_control/core/sqlite/sqlite_client.dart';
import 'package:home_automation_control/data/models/user_model.dart';

abstract class AuthDataSource {
  Future<UserModel> signin(Map<String, dynamic> requestBody);

  Future<UserModel> signup(Map<String, dynamic> requestBody);
}

class AuthDataSourceImpl extends AuthDataSource {
  final SQLiteClient _client;

  AuthDataSourceImpl(this._client);

  @override
  Future<UserModel> signin(Map<String, dynamic> requestBody) async {
    return UserModel.fromMap(await _client.get(requestBody));
  }

  @override
  Future<UserModel> signup(Map<String, dynamic> requestBody) async {
    return UserModel.fromMap(await _client.post(requestBody));
  }
}
