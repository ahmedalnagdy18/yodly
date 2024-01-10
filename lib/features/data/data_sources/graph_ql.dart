const String loginMutation = r"""
mutation login($input :EmailAndPasswordLoginInput!){
  emailAndPasswordLogin(input:$input){
    success
    code
    message
    
} 
}
""";
const String regesturMutation = r"""
mutation register($input :RegisterInput!){
  register(input:$input){
    success
    code
    message
    data{
      id
      userName

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
