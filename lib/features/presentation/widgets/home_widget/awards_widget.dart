import 'package:flutter/material.dart';
import 'package:yodly/core/colors/app_colors.dart';

class AwardsWidet extends StatelessWidget {
  const AwardsWidet({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '5',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: AppColors.n2,
          ),
        ),
        const SizedBox(width: 2),
        Image.asset(
          'images/award1.png',
          width: 10,
        ),
        const SizedBox(width: 5),
        Text(
          '5',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: AppColors.n2,
          ),
        ),
        const SizedBox(width: 2),
        Image.asset(
          'images/award2.png',
          width: 10,
        ),
        const SizedBox(width: 5),
        Text(
          '5',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: AppColors.n2,
          ),
        ),
        const SizedBox(width: 2),
        Image.asset(
          'images/award3.png',
          width: 10,
        ),
        const SizedBox(width: 5),
        Text(
          '5',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: AppColors.n2,
          ),
        ),
        const SizedBox(width: 2),
        Image.asset(
          'images/award4.png',
          width: 10,
        ),
        const SizedBox(width: 5),
        Text(
          '5',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: AppColors.n2,
          ),
        ),
        const SizedBox(width: 2),
        Image.asset(
          'images/award5.png',
          width: 10,
        ),
        const SizedBox(width: 8),
        Text(
          '+5 Awards',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: AppColors.n1,
          ),
        ),
      ],
    );
  }
}
