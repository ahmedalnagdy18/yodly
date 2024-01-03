import 'package:flutter/material.dart';
import 'package:yodly/core/colors/app_colors.dart';
import 'package:yodly/features/presentation/widgets/authentication_widget.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
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
                            const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleWidget(),
                                SizedBox(width: 10),
                                CircleWidget(),
                                SizedBox(width: 10),
                                CircleWidget(),
                                SizedBox(width: 10),
                                CircleWidget(),
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
                              width: 300,
                              child: MaterialButton(
                                onPressed: () {
                                  showDialog(
                                      useSafeArea: true,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          title: Row(
                                            children: [
                                              SizedBox(
                                                height: 40,
                                                width: 30,
                                                child: Checkbox(
                                                  checkColor: Colors.black,
                                                  activeColor: Colors.white,
                                                  side: const BorderSide(
                                                    color: Colors.black,
                                                  ),
                                                  value: isChecked,
                                                  onChanged: (value) {
                                                    isChecked = !isChecked;
                                                    setState(() {});
                                                  },
                                                ),
                                              ),
                                              RichText(
                                                text: const TextSpan(
                                                  text: '''I'm Agree to''',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xff374053),
                                                  ),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text:
                                                          ' Terms of Use and Privacy policy',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            Color(0xff374053),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          content: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: MaterialButton(
                                              onPressed: () {},
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0)),
                                              padding:
                                                  const EdgeInsets.all(0.0),
                                              child: Ink(
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: AppColors.g1,
                                                      begin:
                                                          Alignment.centerRight,
                                                      end: Alignment.centerLeft,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0)),
                                                child: Container(
                                                  constraints:
                                                      const BoxConstraints(
                                                          maxWidth: 300.0,
                                                          minHeight: 50.0),
                                                  alignment: Alignment.center,
                                                  child: const Text(
                                                    "Let's Go",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0)),
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
                                        maxWidth: 300.0, minHeight: 50.0),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      "Submit",
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
  }
}
