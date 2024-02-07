import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yodly/core/colors/app_colors.dart';
import 'package:yodly/features/domain/entites/verify_user_entity.dart';
import 'package:yodly/features/presentation/bloc/verify_user/cubit/verify_user_cubit.dart';
import 'package:yodly/features/presentation/pages/home/navbar.dart';
import 'package:yodly/features/presentation/widgets/textfield_widget.dart';
import 'package:yodly/injection_container.dart';

class AuthenticationPage extends StatelessWidget {
  final String email;

  const AuthenticationPage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerifyUserCubit(verifyUserUsecase: sl()),
      child: AuthenticationPageBody(email: email),
    );
  }
}

class AuthenticationPageBody extends StatefulWidget {
  final String email;
  const AuthenticationPageBody({super.key, required this.email});

  @override
  State<AuthenticationPageBody> createState() => _AuthenticationPageBodyState();
}

class _AuthenticationPageBodyState extends State<AuthenticationPageBody> {
  bool _isButtonEnabled = false;

  bool isChecked = false;
  final TextEditingController _userName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyUserCubit, VerifyUserState>(
      listener: (context, state) {
        if (state is ErrorVerifyUserState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message.toString()),
            action: SnackBarAction(
              label: 'Undo',
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    //  CircleWidget(),
                                    SizedBox(
                                      height: 50,
                                      width: 150,
                                      child: Form(
                                        onChanged: _isEnabled,
                                        child: TextFieldWidget(
                                          hintText: "otp number",
                                          obscureText: false,
                                          mycontroller: _userName,
                                        ),
                                      ),
                                    )
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
                                          decoration: TextDecoration.underline,
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
                                  child: BlocConsumer<VerifyUserCubit,
                                      VerifyUserState>(
                                    listener: (context, state) {
                                      if (state is SucsessVerifyUserState) {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Navbar()));
                                      }
                                    },
                                    builder: (context, state) {
                                      return MaterialButton(
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
                                              gradient: LinearGradient(
                                                colors: AppColors.g2,
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          child: Container(
                                            constraints: const BoxConstraints(
                                                maxWidth: 300.0,
                                                minHeight: 50.0),
                                            alignment: Alignment.center,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                const Text(
                                                  "Submit",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                if (state
                                                    is LoadingVerifyUserState)
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
              ],
            ),
          ),
        );
      },
    );
  }

  void _loginButton(BuildContext context) {
    BlocProvider.of<VerifyUserCubit>(context).verifyUser(VerifyUserEntity(
      email: widget.email,
      verificationCode: _userName.text,
    ));
  }

  void _isEnabled() {
    if (_userName.text.isNotEmpty) {
      _isButtonEnabled = true;
      setState(() {});
    } else {
      _isButtonEnabled = false;
      setState(() {});
    }
    setState(() {});
  }
}
