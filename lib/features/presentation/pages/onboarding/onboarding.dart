import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:yodly/core/colors/app_colors.dart';
import 'package:yodly/features/presentation/pages/authentication/login_and_regsister/login_regsister_page.dart';
import 'package:yodly/features/presentation/widgets/onboarding_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  int _crurentPage = 0;
  @override
  void initState() {
    _crurentPage = _pageController.initialPage;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: AppColors.g1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 66,
            ),
            child: Column(children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) {
                    _crurentPage = value;
                    setState(() {});
                  },
                  itemCount: 3,
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 100),
                            child: Image.asset(
                              oImage[i],
                              height: 300,
                              width: 280,
                              scale: 3,
                            ),
                          ),
                          SizedBox(
                            // height: 60,
                            // width: 280,
                            child: Text(
                              oTitle[i],
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          //  const SizedBox(height: 27),
                          SizedBox(
                            //   height: 36,
                            child: Text(
                              oSubtitle[i],
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 50,
                  top: 100,
                ),
                child: DotsIndicator(
                  dotsCount: 3,
                  position: _crurentPage,
                  decorator: DotsDecorator(
                    size: const Size.square(10),
                    activeSize: const Size(24, 9),
                    activeShape: RoundedRectangleBorder(
                      side: const BorderSide(
                          color: Colors.white, style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(
                        5.0,
                      ),
                    ),
                    activeColor: Colors.white,
                    color: Colors.white,
                    spacing: const EdgeInsets.all(3),
                  ),
                ),
              ),
              Stack(
                children: [
                  Container(
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        if (_crurentPage != 2)
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const LoginRegsisterPage()));
                            },
                            child: const Row(
                              children: [
                                Text(
                                  "Skip",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: RawMaterialButton(
                      onPressed: () {
                        if (_crurentPage == 2) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LoginRegsisterPage(),
                          ));
                        } else {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.decelerate);
                        }
                      },
                      elevation: 0,
                      fillColor: AppColors.p1,
                      padding: const EdgeInsets.all(10.0),
                      shape: const CircleBorder(),
                      child: const Icon(
                        Icons.arrow_right_alt,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
