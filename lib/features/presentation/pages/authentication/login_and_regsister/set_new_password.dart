import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yodly/core/colors/app_colors.dart';
import 'package:yodly/features/domain/entites/authentication/forget_password_entity.dart';
import 'package:yodly/features/presentation/cubit/authentication_cubit/forget_password/cubit/forget_password_cubit.dart';
import 'package:yodly/features/presentation/pages/authentication/login_and_regsister/login_page.dart';
import 'package:yodly/injection_container.dart';

class NewPasswordPage extends StatelessWidget {
  final String email;
  final String code;
  const NewPasswordPage({super.key, required this.email, required this.code});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(forgetPasswordUsecase: sl()),
      child: _NewPasswordPage(email: email, code: code),
    );
  }
}

class _NewPasswordPage extends StatefulWidget {
  final String email;
  final String code;
  const _NewPasswordPage({required this.email, required this.code});

  @override
  State<_NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<_NewPasswordPage> {
  bool _isButtonEnabled = false;
  final TextEditingController _password = TextEditingController();
  final TextEditingController _password2 = TextEditingController();
  bool isObscuretext = true;
  bool isObscuretext2 = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: _isEnabled,
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ErrorForgetPasswordState) {
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
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 150, bottom: 30),
                          child: SizedBox(
                            width: 150,
                            height: 70,
                            child: Image.asset('images/forgot.png'),
                          ),
                        ),
                        const Text(
                          "Set new password",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 45),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 22),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 15,
                                  offset: const Offset(
                                      0, 20), // changes position of shadow
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 30),
                                  const Text(
                                    'Enter New Password',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff3E4B4B),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    obscureText: isObscuretext,
                                    controller: _password,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 203, 202, 202)),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isObscuretext = !isObscuretext;
                                          });
                                        },
                                        child: Icon(
                                          isObscuretext
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                        ),
                                      ),
                                      hintStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  const Text(
                                    'Confirm New Password',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff3E4B4B),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    obscureText: isObscuretext2,
                                    controller: _password2,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 203, 202, 202)),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isObscuretext2 = !isObscuretext2;
                                          });
                                        },
                                        child: Icon(
                                          isObscuretext2
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                        ),
                                      ),
                                      hintStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  SizedBox(
                                    height: 48,
                                    child: BlocListener<ForgetPasswordCubit,
                                        ForgetPasswordState>(
                                      listener: (context, state) {
                                        if (state
                                            is SucsessForgetPasswordState) {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              Future.delayed(
                                                  const Duration(seconds: 2),
                                                  () {
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const LoginPage())); // Close the dialog
                                              });
                                              return AlertDialog(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                content: SizedBox(
                                                  width: 300,
                                                  height: 290,
                                                  child: Column(
                                                    children: [
                                                      const SizedBox(
                                                          height: 30),
                                                      const Text(
                                                        'Thanks!',
                                                        style: TextStyle(
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              Color(0xff2A3838),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 25),
                                                      Image.asset(
                                                        'images/registeration.png',
                                                        scale: 3,
                                                      ),
                                                      const SizedBox(
                                                          height: 30),
                                                      const Text(
                                                        'Your Password Changed Successfully',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              Color(0xff2A3838),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        }
                                      },
                                      child: MaterialButton(
                                        onPressed: () {
                                          if (_password.text.isEmpty ||
                                              _password2.text.isEmpty) {
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
                                            constraints: const BoxConstraints(
                                              //     maxWidth: 300.0,
                                              minHeight: 50.0,
                                            ),
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
                                                    is LoadingForgetPasswordState)
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
                                  const Center(child: SizedBox(height: 40)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _loginButton(BuildContext context) {
    if (_password.text == _password2.text) {
      BlocProvider.of<ForgetPasswordCubit>(context).forgetPassword(
          ForgetPasswordEntity(
              email: widget.email,
              code: widget.code,
              newPassword: _password.text));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: const Text('Error ! password not same'),
        action: SnackBarAction(
          label: 'Undo',
          textColor: Colors.white,
          onPressed: () {},
        ),
      ));
    }
  }

  void _isEnabled() {
    if (_password.text.isNotEmpty && _password2.text.isNotEmpty) {
      _isButtonEnabled = true;
      setState(() {});
    } else {
      _isButtonEnabled = false;
      setState(() {});
    }
    setState(() {});
  }
}
