class SignInRequestParams {
  String username = '';
  String password = '';

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };
}
