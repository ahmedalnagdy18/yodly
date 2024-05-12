import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yodly/core/colors/app_colors.dart';
import 'package:yodly/features/domain/entites/authentication/does_verification_exist_entity.dart';
import 'package:yodly/features/presentation/cubit/authentication_cubit/does_user_exist/cubit/does_user_exist_cubit.dart';
import 'package:yodly/features/presentation/pages/authentication/login_and_regsister/set_new_password.dart';
import 'package:yodly/features/presentation/widgets/acthentication/otp_widget.dart';
import 'package:yodly/injection_container.dart';

class Authentication2Page extends StatelessWidget {
  final String email;

  const Authentication2Page({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DoesUserExistCubit(doesVerificationExistUsecase: sl()),
      child: _Authentication2Page(email),
    );
  }
}

class _Authentication2Page extends StatefulWidget {
  final String email;

  const _Authentication2Page(this.email);

  @override
  State<_Authentication2Page> createState() => _Authentication2PageState();
}

class _Authentication2PageState extends State<_Authentication2Page> {
  bool _isButtonEnabled = false;

  final TextEditingController _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoesUserExistCubit, DoesUserExistState>(
      listener: (context, state) {
        if (state is ErrorDoesUserExistState) {
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
          backgroundColor: const Color.fromARGB(255, 236, 244, 248),
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
                  child: Form(
                    onChanged: _isEnabled,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 150, bottom: 30),
                          child: SizedBox(
                            width: 150,
                            height: 70,
                            child: Image.asset('images/registeration.png'),
                          ),
                        ),
                        const Text(
                          "Authenticate your \n account",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          "Please enter the 4-digit OTP code sent to \n your Email osa*********@gmail.com",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          width: 330,
                          height: 220,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      OtpWidget(controller: _otpController)
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  RichText(
                                    text: const TextSpan(
                                      text: 'Didn’t receive a code?  ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff374053),
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Resend',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff6B7DCF),
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  SizedBox(
                                    height: 51,
                                    child: BlocConsumer<DoesUserExistCubit,
                                        DoesUserExistState>(
                                      listener: (context, state) {
                                        if (state
                                            is SucsessDoesUserExistState) {
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      NewPasswordPage(
                                                        email: widget.email,
                                                        code:
                                                            _otpController.text,
                                                      )));
                                        }
                                      },
                                      builder: (context, state) {
                                        return MaterialButton(
                                          onPressed: () {
                                            if (_otpController.text.isEmpty) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                backgroundColor: Colors.red,
                                                content: const Text(
                                                    'Error ! you must write all field'),
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
                                                gradient: LinearGradient(
                                                  colors: AppColors.g2,
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30.0)),
                                            child: Container(
                                              constraints: const BoxConstraints(
                                                  maxWidth: 300.0,
                                                  minHeight: 50.0),
                                              alignment: Alignment.center,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  const Text(
                                                    "Submit",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  if (state
                                                      is LoadingDoesUserExistState)
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
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
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
    BlocProvider.of<DoesUserExistCubit>(context)
        .doesUserExist(DoesVerificationExistEntity(
      email: widget.email,
      useCase: "PASSWORD_RESET",
      code: _otpController.text,
    ));
  }

  void _isEnabled() {
    if (_otpController.text.isNotEmpty) {
      _isButtonEnabled = true;
      setState(() {});
    } else {
      _isButtonEnabled = false;
      setState(() {});
    }
    setState(() {});
  }
}
