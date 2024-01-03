import 'package:flutter/material.dart';
import 'package:yodly/core/colors/app_colors.dart';
import 'package:yodly/features/presentation/pages/home/home_page.dart';
import 'package:yodly/features/presentation/widgets/contact_us_widget.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Contact Us',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 30,
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    height: 80,
                    width: 80,
                    child: Image.asset(
                      'images/yodly.png',
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    'We are happy to receive your \n comments and suggestions',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff293E6F),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'User name*',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.p4,
                  ),
                ),
                const SizedBox(height: 8),
                const ContactUsWidget(),
                const SizedBox(height: 20),
                Text(
                  'Email*',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.p4,
                  ),
                ),
                const SizedBox(height: 8),
                const ContactUsWidget(),
                const SizedBox(height: 20),
                Text(
                  'Phone Number*',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.p4,
                  ),
                ),
                const SizedBox(height: 8),
                const ContactUsWidget(),
                const SizedBox(height: 20),
                Text(
                  'Message reason*',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.p4,
                  ),
                ),
                const SizedBox(height: 8),
                const ContactUsWidget(),
                const SizedBox(height: 20),
                Text(
                  'Your Message*',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.p4,
                  ),
                ),
                const SizedBox(height: 8),
                const ContactUsWidget2(),
                const SizedBox(height: 25),
                SizedBox(
                  height: 50,
                  child: MaterialButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          Future.delayed(const Duration(seconds: 2), () {
                            Navigator.of(context).pop(); // Close the dialog
                          });
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            content: SizedBox(
                              width: 300,
                              height: 290,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  //   const SizedBox(height: 30),
                                  Image.asset(
                                    'images/yodly.png',
                                    scale: 3,
                                  ),
                                  //    const SizedBox(height: 30),
                                  Text(
                                    'Your message has been \n arrived successfuly',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.p4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
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
                          "Send Message",
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
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
