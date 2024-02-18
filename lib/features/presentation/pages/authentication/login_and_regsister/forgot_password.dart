import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yodly/core/colors/app_colors.dart';
import 'package:yodly/features/domain/entites/send_email_verification_code_entity.dart';
import 'package:yodly/features/presentation/bloc/SendEmailVerificationCode/cubit/send_email_verification_code_cubit.dart';
import 'package:yodly/features/presentation/pages/authentication/authentication_pages/authentication2_page2.dart';
import 'package:yodly/injection_container.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SendEmailVerificationCodeCubit(
          sendEmailVerificationCodeUsecase: sl()),
      child: const _ForgotPassword(),
    );
  }
}

class _ForgotPassword extends StatefulWidget {
  const _ForgotPassword();

  @override
  State<_ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<_ForgotPassword> {
  bool _isButtonEnabled = false;

  final TextEditingController _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SendEmailVerificationCodeCubit,
        SendEmailVerificationCodeState>(
      listener: (context, state) {
        if (state is ErrorEmailVerificationCodeState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(state.message.toString()),
            action: SnackBarAction(
              label: 'Undo',
              textColor: Colors.white,
              onPressed: () {},
            ),
          ));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Opacity(
                  opacity: .25,
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: AppColors.g2),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Form(
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 150, bottom: 30),
                            child: SizedBox(
                              width: 150,
                              height: 70,
                              child: Image.asset('images/forgot.png'),
                            ),
                          ),
                          const Text(
                            "Forgot Password",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            "Enter your Email that you registered with \n  and we will send you a code to verify \n  and reset your password.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Color(0xff2A3838),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 15,
                                  offset: const Offset(
                                      0, 20), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 34),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Email *',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff3E4B4B),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    height: 48,
                                    child: TextFormField(
                                      controller: _email,
                                      onChanged: (value) {
                                        _isEnabled();
                                      },
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: const BorderSide(
                                              color: Colors.grey),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 203, 202, 202)),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  SizedBox(
                                    height: 48,
                                    child: BlocListener<
                                        SendEmailVerificationCodeCubit,
                                        SendEmailVerificationCodeState>(
                                      listener: (context, state) {
                                        if (state
                                            is SucsessEmailVerificationCodeState) {
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Authentication2Page(
                                                        email: _email.text,
                                                      )));
                                        }
                                      },
                                      child: MaterialButton(
                                        onPressed: () {
                                          if (_email.text.isEmpty) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              backgroundColor: Colors.red,
                                              content: const Text(
                                                  'Error ! you must write the field'),
                                              action: SnackBarAction(
                                                label: 'Undo',
                                                textColor: Colors.white,
                                                onPressed: () {},
                                              ),
                                            ));
                                          }
                                          if (_isButtonEnabled) {
                                            _loginButton(context);
                                          }
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25.0)),
                                        padding: const EdgeInsets.all(0.0),
                                        child: Ink(
                                          decoration: BoxDecoration(
                                              color: !_isButtonEnabled
                                                  ? Colors.grey
                                                  : null,
                                              gradient: !_isButtonEnabled
                                                  ? null
                                                  : LinearGradient(
                                                      colors: AppColors.g2,
                                                      begin:
                                                          Alignment.centerRight,
                                                      end: Alignment.centerLeft,
                                                    ),
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                const Text(
                                                  "Send",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                if (state
                                                    is LoadingEmailVerificationCodeState)
                                                  SizedBox(
                                                    width: 15,
                                                    height: 15,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: AppColors.n1,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _loginButton(BuildContext context) {
    BlocProvider.of<SendEmailVerificationCodeCubit>(context)
        .sendEmailVerificationCode(SendEmailVerificationCodeEntity(
            email: _email.text, useCase: 'PASSWORD_RESET'));
  }

  void _isEnabled() {
    if (_email.text.isNotEmpty) {
      _isButtonEnabled = true;
      setState(() {});
    } else {
      _isButtonEnabled = false;
      setState(() {});
    }
    setState(() {});
  }
}
