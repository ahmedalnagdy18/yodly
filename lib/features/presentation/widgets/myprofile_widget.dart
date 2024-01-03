import 'package:flutter/material.dart';
import 'package:yodly/core/colors/app_colors.dart';
import 'package:yodly/features/presentation/pages/home/followers_page.dart';
import 'package:yodly/features/presentation/pages/home/following_page.dart';
import 'package:yodly/features/presentation/widgets/post_widget2.dart';

class MyProfileWidget extends StatelessWidget {
  const MyProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    '20',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.p4,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Reviews',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.n2,
                    ),
                  ),
                ],
              ),
              SizedBox(
                  height: 40,
                  child: VerticalDivider(
                    color: AppColors.p4,
                    thickness: 1,
                  )),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FollowersPage()));
                },
                child: Column(
                  children: [
                    Text(
                      '100',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.p4,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Followers',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.n2,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
                child: VerticalDivider(
                  color: AppColors.p4,
                  thickness: 1,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FollowingPage()));
                },
                child: Column(
                  children: [
                    Text(
                      '50K',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.p4,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Following',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.n2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Text(
            'my Awards',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.p4,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: SizedBox(
            height: 100,
            child: ListView.separated(
              itemBuilder: (context, index) => SizedBox(
                height: 100,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'images/kingpicprofile.png',
                          height: 70,
                        ),
                        const Text('+100'),
                      ],
                    ),
                  ],
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(width: 5),
              itemCount: 5,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Text(
            'my Reviews',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.p4,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const PostWidget2(),
        const SizedBox(height: 30),
        const PostWidget2(),
      ],
    );
  }
}
