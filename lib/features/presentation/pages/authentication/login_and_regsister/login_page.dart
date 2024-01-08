import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yodly/core/colors/app_colors.dart';
import 'package:yodly/features/domain/entites/login_entity.dart';
import 'package:yodly/features/presentation/bloc/cubit/login_cubit.dart';
import 'package:yodly/features/presentation/pages/authentication/login_and_regsister/Registeration_page.dart';
import 'package:yodly/features/presentation/pages/authentication/login_and_regsister/forgot_password.dart';
import 'package:yodly/features/presentation/pages/home/home_page.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is ErrorLoginState) {
          // AlertDialog(
          //   actions: [
          //     Text("Errrrrror"),
          //   ],
          // );
        }
      },
      builder: (context, state) {
        return Scaffold(
          //backgroundColor: const Color.fromARGB(255, 236, 244, 248),
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
                    onChanged: _isEnabled,
                    autovalidateMode: AutovalidateMode.always,
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
                              color: AppColors.n1,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) =>
                                EmailValidator.validate(value!)
                                    ? null
                                    : "Please enter a valid email",
                            controller: _email,
                            decoration: InputDecoration(
                                errorStyle: const TextStyle(fontSize: 0.01),
                                errorBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 203, 202, 202)),
                                ),
                                prefixIcon:
                                    const Icon(Icons.email_outlined, size: 20),
                                hintText: 'Email*',
                                filled: true,
                                fillColor: Colors.white,
                                hintStyle: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400)),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            obscureText: true,
                            controller: _password,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 203, 202, 202)),
                                ),
                                prefixIcon:
                                    const Icon(Icons.lock_outline, size: 20),
                                hintText: 'Password*',
                                filled: true,
                                fillColor: Colors.white,
                                hintStyle: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400)),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgotPassword()));
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
                        BlocListener<LoginCubit, LoginState>(
                          listener: (context, state) {
                            if (state is SucsessLoginState) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                            }
                          },
                          child: Center(
                            child: SizedBox(
                              height: 51,
                              width: 180,
                              child: MaterialButton(
                                onPressed: () {
                                  if (_isButtonEnabled) _loginButton(context);
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0)),
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
                                              begin: Alignment.centerRight,
                                              end: Alignment.centerLeft,
                                            ),
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  child: Container(
                                    constraints: const BoxConstraints(
                                        maxWidth: 300.0, minHeight: 50.0),
                                    alignment: Alignment.center,
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
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Row(children: <Widget>[
                          const Expanded(child: Divider(thickness: 2)),
                          const SizedBox(width: 20),
                          Text("OR",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.n1,
                              )),
                          const SizedBox(width: 20),
                          const Expanded(child: Divider(thickness: 2)),
                        ]),
                        const SizedBox(height: 30),
                        Center(
                          child: Text('Login',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: AppColors.n1,
                              )),
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child:
                              Text('Log in with one of the following options',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.n2,
                                  )),
                        ),
                        const SizedBox(height: 40),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white,
                              ),
                              clipBehavior: Clip.antiAlias,
                              width: 50,
                              height: 50,
                              child: Image.asset(
                                'images/Facebook.png',
                                scale: 3,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white,
                              ),
                              clipBehavior: Clip.antiAlias,
                              width: 50,
                              height: 50,
                              child: Image.asset(
                                'images/Apple.png',
                                scale: 3,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white,
                              ),
                              clipBehavior: Clip.antiAlias,
                              width: 50,
                              height: 50,
                              child: Image.asset(
                                'images/Google.png',
                                scale: 3,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('''Don't have an account''',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.n1,
                                )),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterationPage()));
                              },
                              child: Text('Create account',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.n1,
                                    decoration: TextDecoration.underline,
                                  )),
                            ),
                          ],
                        ),
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
      _loginButton(context);
      setState(() {});
    } else {
      _isButtonEnabled = false;
      setState(() {});
    }
    setState(() {});
  }
}
