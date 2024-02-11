const String loginMutation = r"""
mutation login($input :EmailAndPasswordLoginInput!){
  emailAndPasswordLogin(input:$input){
    success
    code
    message
    
} 
}
""";
const String registerMutation = r"""
mutation register($input :RegisterInput!){
  register(input:$input){
    success
    code
    message
    data{
     token
    }
} 
}
""";

const String forgetPasswordMutation = r"""
mutation ResetPasswordByEmailInput ($input:ResetPasswordByEmailInput!){
  resetPasswordByEmail(input:$input){
    data{
      id
    }
    code
    success
    message
    
  }
}
""";

const String sendEmailVerificationCodee = r"""
mutation sendEmailVerificationCode($input:SendEmailVerificationCodeInput!){
  sendEmailVerificationCode(input:$input){
    data
    code
    success
    message
  }
}
""";

const String verifyUserByEmailInput = r"""
mutation verifyUserByEmail($input:VerifyUserByEmailInput!){
  verifyUserByEmail(input:$input){
    data{
      token
    }
    code
    success
    message
  }
}
""";

const String verficationOtpQuery = r"""
query doesUserWithVerificationCodeExist($input:IsUserWithVerificationCodeExistInput!){
  doesUserWithVerificationCodeExist (input:$input){
  data
    code
    success
     message
  }
}
""";
