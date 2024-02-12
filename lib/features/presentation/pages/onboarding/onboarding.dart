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
  ImageProvider logo = const AssetImage('images/frame.png');

  int _crurentPage = 0;
  @override
  void didChangeDependencies() {
    precacheImage(logo, context, size: const Size(10000, 1000000));
    super.didChangeDependencies();
  }

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
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 100,
                  ),
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (value) {
                      _crurentPage = value;
                      setState(() {});
                    },
                    itemCount: onboardingList.length,
                    itemBuilder: (_, i) {
                      return OnboardingBody(
                          image: onboardingList[i].image,
                          title: onboardingList[i].title,
                          subtitle: onboardingList[i].subtitle);
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 50,
                  top: 25,
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

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });
  final String image;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              image,
              height: 250,
              width: 250,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            title,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            subtitle,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
