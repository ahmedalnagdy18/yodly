import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yodly/core/colors/app_colors.dart';
import 'package:yodly/core/shared_prefrances/shared_prefrance.dart';
import 'package:yodly/features/presentation/pages/home/navbar.dart';
import 'package:yodly/features/presentation/pages/onboarding/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void init() async {}

  @override
  void initState() {
    init();

    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              final token = SharedPrefrance.instanc.getToken('token');
              if (token == null) {
                return const OnboardingScreen();
              }
              return const Navbar();
            })));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.g3),
      ),
      child: Image.asset(
        'images/logo.png',
        scale: 3,
      ),
    );
  }
}
