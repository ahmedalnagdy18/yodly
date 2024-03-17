import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yodly/core/colors/app_colors.dart';
import 'package:yodly/features/domain/entites/authentication/login_entity.dart';
import 'package:yodly/features/presentation/cubit/authentication_cubit/login_cubit/login_cubit.dart';
import 'package:yodly/features/presentation/pages/authentication/login_and_regsister/forgot_password.dart';
import 'package:yodly/features/presentation/pages/home/navbar.dart';
import 'package:yodly/features/presentation/widgets/acthentication/login_button.dart';
import 'package:yodly/features/presentation/widgets/acthentication/login_widget.dart';
import 'package:yodly/features/presentation/widgets/textfield_widget.dart';
import 'package:yodly/injection_container.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(loginUsecase: sl()),
      child: const _LoginPageBody(),
    );
  }
}

class _LoginPageBody extends StatefulWidget {
  const _LoginPageBody();

  @override
  State<_LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<_LoginPageBody> {
  bool _isButtonEnabled = false;

  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();
  bool isObscuretext = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is ErrorLoginState) {
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    onChanged: _isEnabled,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 83),
                          child: Text(
                            'Welcome back',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: AppColors.p4,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFieldWidget(
                          hintText: 'Email*',
                          obscureText: false,
                          mycontroller: _email,
                          validator: (value) => EmailValidator.validate(value!)
                              ? null
                              : "Please enter a valid email",
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon:
                              const Icon(Icons.email_outlined, size: 20),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFieldWidget(
                          hintText: 'Password*',
                          obscureText: isObscuretext,
                          mycontroller: _password,
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
                          prefixIcon: const Icon(Icons.lock_outline, size: 20),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgetPasswordPage()));
                              },
                              child: Text('Forgot password ?',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.n1,
                                    decoration: TextDecoration.underline,
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: SizedBox(
                            height: 51,
                            width: 180,
                            child: BlocListener<LoginCubit, LoginState>(
                                listener: (context, state) {
                                  if (state is SucsessLoginState) {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Navbar()));
                                  }
                                },
                                child: LoginButton(
                                  onPressed: () {
                                    if (_email.text.isEmpty ||
                                        _password.text.isEmpty) {
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
                                  decoration: BoxDecoration(
                                      color: !_isButtonEnabled
                                          ? Colors.grey
                                          : null,
                                      gradient: !_isButtonEnabled
                                          ? null
                                          : LinearGradient(
                                              colors: AppColors.g2,
                                              begin: Alignment.centerRight,
                                              end: Alignment.centerLeft,
                                            ),
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Text(
                                        "Login",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      if (state is LoadingLoginState)
                                        SizedBox(
                                          width: 15,
                                          height: 15,
                                          child: CircularProgressIndicator(
                                            color: AppColors.n1,
                                          ),
                                        ),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                        const SizedBox(height: 40),
                        const LoginWidget(),
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
    BlocProvider.of<LoginCubit>(context).login(LoginEntity(
        email: _email.text, password: _password.text, deviceName: "ANDROID"));
  }

  void _isEnabled() {
    if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
      _isButtonEnabled = true;
      setState(() {});
    } else {
      _isButtonEnabled = false;
      setState(() {});
    }
    setState(() {});
  }
}
