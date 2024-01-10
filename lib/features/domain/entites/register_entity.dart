class RegisterEntity {
  final String email;
  final String password;
  final String deviceName;
  final String userName;
  final String displayName;
  final String country;

  RegisterEntity(
      {required this.userName,
      required this.displayName,
      required this.country,
      required this.email,
      required this.password,
      required this.deviceName});

  toJson() {
    return {
      "email": email,
      "password": password,
      "device": deviceName,
      "userName": userName,
      "displayName": displayName,
      "country": country,
    };
  }
}
