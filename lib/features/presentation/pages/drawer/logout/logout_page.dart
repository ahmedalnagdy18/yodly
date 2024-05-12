import 'package:flutter/material.dart';
import 'package:yodly/core/colors/app_colors.dart';
import 'package:yodly/core/shared_prefrances/shared_prefrance.dart';
import 'package:yodly/features/presentation/pages/authentication/login_and_regsister/login_regsister_page.dart';
import 'package:yodly/features/presentation/pages/home/home_page.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Logout',
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
              horizontal: 35,
              vertical: 65,
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
                  const SizedBox(height: 50),
                  Text(
                    'Do you want to logout?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.p4,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        height: 50,
                        minWidth: 140,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: AppColors.n1),
                            borderRadius: BorderRadius.circular(25)),
                        color: Colors.transparent,
                        elevation: 0,
                        // onPressed: () {
                        //   Navigator.of(context).push(MaterialPageRoute(
                        //       builder: (context) =>
                        //           const LoginRegsisterPage()));
                        // },
                        onPressed: () async {
                          await SharedPrefrance.instanc
                              .removeFromShared(key: 'token');
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const LoginRegsisterPage()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Yes",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.p4,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 140,
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.of(context).pop(MaterialPageRoute(
                                builder: (context) => const HomePage()));
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
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Container(
                              constraints: const BoxConstraints(),
                              alignment: Alignment.center,
                              child: const Text(
                                "No",
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
