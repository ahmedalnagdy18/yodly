class ForgetPasswordEntity {
  final String email;
  final String code;
  final String newPassword;

  ForgetPasswordEntity(
      {required this.email, required this.code, required this.newPassword});

  toJson() {
    return {
      "email": email,
      "code": code,
      "newPassword": newPassword,
    };
  }
}
