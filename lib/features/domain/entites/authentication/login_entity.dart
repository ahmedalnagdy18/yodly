class LoginEntity {
  final String email;
  final String password;
  final String deviceName;

  LoginEntity(
      {required this.email, required this.password, required this.deviceName});

  toJson() {
    return {
      "email": email,
      "password": password,
      "device": deviceName,
    };
  }
}
