import 'package:flutter/material.dart';
import 'package:yodly/core/colors/app_colors.dart';
import 'package:yodly/features/presentation/pages/home/home_page.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'About Yodly',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.p4,
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.of(context)
                .pop(MaterialPageRoute(builder: (context) => const HomePage()));
          },
          child: Icon(
            Icons.menu,
            color: AppColors.p4,
          ),
        ),
        actions: [
          Row(
            children: [
              Icon(
                Icons.notifications_outlined,
                color: AppColors.p4,
              ),
            ],
          ),
          const SizedBox(width: 20),
        ],
        iconTheme: IconThemeData(color: AppColors.p4),
        toolbarHeight: 100,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25.0),
            bottomRight: Radius.circular(25.0),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 30,
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: Image.asset(
                      'images/about.png',
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Yodly App',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.p4,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'The app helps you connect the two parties \n through voice, or chat consultations and lets \n you start',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.n1,
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: Image.asset(
                      'images/about.png',
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Our Mission',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.p4,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Expera aims to making consultations accessible \n or anyone who needs it at an affordable cost \n and high level of professionalism. ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.n1,
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: Image.asset(
                      'images/about.png',
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Our Vision',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.p4,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'We envision a world where consultations are \n easy to attain and affordable. With no \n compromise  for quality and easy navigation.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.n1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
