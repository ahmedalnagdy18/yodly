import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:yodly/core/colors/app_colors.dart';
import 'package:yodly/features/presentation/pages/home/myprofile_page.dart';
import 'package:yodly/features/presentation/widgets/change_myprofile_widget.dart';

class ChangeMyProfilePage extends StatelessWidget {
  const ChangeMyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // SizedBox(
            //   width: double.infinity,
            //   height: 220,
            //   child: Image.asset(
            //     'images/coverpic.png',
            //     fit: BoxFit.cover,
            //   ),
            // ),
            SizedBox(
              height: 220,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset('images/coverpic.png', fit: BoxFit.cover),
                  ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                      child: Container(
                        color: Colors.black.withOpacity(0.2),
                        alignment: Alignment.center,
                        child: const Text(
                          'Change Cover',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 160,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white),
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset('images/nagdi.png', fit: BoxFit.cover),
                            ClipRRect(
                              // Clip it cleanly.
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                                child: Container(
                                  color: Colors.grey.withOpacity(0.1),
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    Icons.add_a_photo_outlined,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      'User Name',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff3E4B4B),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const ChangeMyProfileTextField(),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff3E4B4B),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const ChangeMyProfileTextField(),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      'Bio',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff3E4B4B),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const ChangeMyProfileBio(),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      'Country',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff3E4B4B),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const ChangeMyProfileTextField(),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      'City',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff3E4B4B),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const ChangeMyProfileTextField(),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        height: 50,
                        minWidth: 150,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: AppColors.n1),
                            borderRadius: BorderRadius.circular(25)),
                        color: Colors.transparent,
                        elevation: 0,
                        onPressed: () {
                          Navigator.of(context).pop(MaterialPageRoute(
                              builder: (context) => const MyProfilePage()));
                        },
                        child: Row(
                          children: [
                            Text(
                              "Cancel",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.n1,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 150,
                        child: MaterialButton(
                          onPressed: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => const HomePage()));
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0)),
                          padding: const EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: AppColors.g2,
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft,
                                ),
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Container(
                              constraints: const BoxConstraints(),
                              alignment: Alignment.center,
                              child: const Text(
                                "save",
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
          ],
        ),
      ),
    );
  }
}
