class DoesVerificationExistEntity {
  final String email;
  final String code;
  final String useCase;

  DoesVerificationExistEntity(
      {required this.email, required this.code, required this.useCase});

  toJson() {
    return {
      "email": email,
      "code": code,
      "useCase": useCase,
    };
  }
}
