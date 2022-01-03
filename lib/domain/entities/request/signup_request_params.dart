class SignUpRequestParams {
  String username = '';
  String password = '';
  String email = '';

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'email': email,
      };
}
