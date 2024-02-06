import 'package:flutter/material.dart';
import 'package:yodly/core/colors/app_colors.dart';
import 'package:yodly/features/presentation/pages/authentication/login_and_regsister/Registeration_page.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          child: Text('Log in with one of the following options',
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
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const RegisterationPage()));
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
    );
  }
}
