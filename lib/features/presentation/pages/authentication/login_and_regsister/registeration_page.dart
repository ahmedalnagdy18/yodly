import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yodly/core/colors/app_colors.dart';
import 'package:yodly/features/domain/entites/register_entity.dart';
import 'package:yodly/features/domain/entites/send_email_verification_code_entity.dart';
import 'package:yodly/features/presentation/bloc/SendEmailVerificationCode/cubit/send_email_verification_code_cubit.dart';
import 'package:yodly/features/presentation/bloc/cubit/register/cubit/register_cubit.dart';
import 'package:yodly/features/presentation/bloc/verify_user/cubit/verify_user_cubit.dart';
import 'package:yodly/features/presentation/pages/authentication/authentication_pages/authentication2_page2.dart';
import 'package:yodly/features/presentation/pages/authentication/authentication_pages/authentication_page.dart';
import 'package:yodly/features/presentation/pages/authentication/login_and_regsister/Login_page.dart';
import 'package:yodly/features/presentation/pages/home/navbar.dart';
import 'package:yodly/features/presentation/widgets/Registeration_widget.dart';
import 'package:yodly/injection_container.dart';

class RegisterationPage extends StatelessWidget {
  const RegisterationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterCubit>(
          create: (BuildContext context) =>
              RegisterCubit(registerUsecase: sl()),
        ),
        BlocProvider<SendEmailVerificationCodeCubit>(
          create: (BuildContext context) => SendEmailVerificationCodeCubit(
              sendEmailVerificationCodeUsecase: sl()),
        ),
      ],
      child: const _RegisterationPageBody(),
    );
    //   create: (context) => RegisterCubit(registerUsecase: sl()),
    //   child: const _RegisterationPageBody(),
    // );
  }
}

class _RegisterationPageBody extends StatefulWidget {
  const _RegisterationPageBody();

  @override
  State<_RegisterationPageBody> createState() => _RegisterationPageState();
}

class _RegisterationPageState extends State<_RegisterationPageBody> {
  bool _isButtonEnabled = false;

  final TextEditingController _userName = TextEditingController();

  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();
  //final TextEditingController _displayName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {},
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 75,
                  ),
                  child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    onChanged: _isEnabled,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Join Yodly',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.n1,
                                  ),
                                ),
                              ],
                            ),
                            //  const SizedBox(width: 210),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Navbar()));
                                  },
                                  child: const Text(
                                    'Skip',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff969CAA),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white),
                            clipBehavior: Clip.antiAlias,
                            width: 70,
                            height: 70,
                            child: Image.asset(
                              'images/nagdi.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          // padding: const EdgeInsets.symmetric(horizontal: 30),
                          // width: 400,
                          height: 50,
                          child: TextFormField(
                            controller: _userName,
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
                                prefixIcon: const Icon(Icons.person_2_outlined,
                                    size: 20),
                                hintText: 'User name* ',
                                filled: true,
                                fillColor: Colors.white,
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.n3,
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
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
                                hintText: 'JohnDeo@gmail.com',
                                filled: true,
                                fillColor: Colors.white,
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.n3,
                                )),
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
                                //sss
                                filled: true,
                                fillColor: Colors.white,
                                hintStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Center(
                          child: Text(
                            'By clicking Agree and Register, you agree to Terms of use and',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w300,
                              color: Color(0xff374053),
                            ),
                          ),
                        ),
                        const SizedBox(height: 3),
                        const Center(
                          child: Text(
                            'Privacy policy',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff374053),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        BlocListener<SendEmailVerificationCodeCubit,
                            SendEmailVerificationCodeState>(
                          listener: (context, state) {
                            if (state is SucsessEmailVerificationCodeState) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const AuthenticationPage()));
                            }
                          },
                          child: BlocListener<RegisterCubit, RegisterState>(
                            listener: (context, state) {
                              if (state is SucsessRegsisterState) {
                                BlocProvider.of<SendEmailVerificationCodeCubit>(
                                        context)
                                    .sendEmailVerificationCode(
                                        SendEmailVerificationCodeEntity(
                                  email: _email.text,
                                  useCase: 'EMAIL_VERIFICATION',
                                ));
                              }
                            },
                            child: Center(
                              child: SizedBox(
                                height: 51,
                                width: 300,
                                child: MaterialButton(
                                  onPressed: () {
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
                                                begin: Alignment.centerRight,
                                                end: Alignment.centerLeft,
                                              ),
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                    child: Container(
                                      constraints: const BoxConstraints(
                                        maxWidth: 300.0,
                                        minHeight: 50.0,
                                      ),
                                      alignment: Alignment.center,
                                      child: const Text(
                                        "Agree & Register",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        const RDvider(),
                        const SizedBox(height: 30),
                        Center(
                          child: Text(
                            'Sign up with one of the following options',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.n1,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        const RIcon(), //Facebook,Apple,Google ... icon
                        const SizedBox(height: 50),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('''Aleardy ave an account''',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.n1,
                                )),
                            const SizedBox(width: 15),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage()));
                              },
                              child: Text('Login',
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
    print('zzzzzzzzzzzzzzzzzzz');
    BlocProvider.of<RegisterCubit>(context).register(RegisterEntity(
      email: _email.text,
      password: _password.text,
      deviceName: "ANDROID",
      userName: _userName.text,
      //  displayName: _displayName.text,
      country: 'eg',
    ));
  }

  void _isEnabled() {
    if (_email.text.isNotEmpty &&
        //  _displayName.text.isNotEmpty &&
        _password.text.isNotEmpty &&
        _userName.text.isNotEmpty) {
      _isButtonEnabled = true;
      setState(() {});
    } else {
      _isButtonEnabled = false;
      setState(() {});
    }
    setState(() {});
  }
}
