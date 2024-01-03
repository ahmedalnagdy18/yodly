import 'package:flutter/material.dart';
import 'package:yodly/core/colors/app_colors.dart';
import 'package:yodly/features/presentation/pages/home/fan_profile.dart';

class FollowersPageWidget extends StatelessWidget {
  const FollowersPageWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const FanProfilePage()));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.p4,
            ),
          ),
          Text(
            '95 followers',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.n1,
            ),
          ),
          Text(
            '30 Award',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: AppColors.n2,
            ),
          ),
        ],
      ),
    );
  }
}

class FollowButtom extends StatelessWidget {
  const FollowButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 32,
      minWidth: 90,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.p4),
          borderRadius: BorderRadius.circular(25)),
      color: Colors.transparent,
      elevation: 0,
      onPressed: () {
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) =>
        //         const ChangeMyProfilePage()));
      },
      child: Text(
        "Follow",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.n1,
          fontSize: 11,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
