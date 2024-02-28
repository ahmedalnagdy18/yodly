import 'package:flutter/material.dart';
import 'package:yodly/core/colors/app_colors.dart';

class AddServiceReactionWidget extends StatefulWidget {
  const AddServiceReactionWidget({super.key});

  @override
  State<AddServiceReactionWidget> createState() =>
      _AddServiceReactionWidgetState();
}

class _AddServiceReactionWidgetState extends State<AddServiceReactionWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            SizedBox(
              width: 30,
              height: 30,
              child: Image.asset(
                "images/happy.png",
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Happy',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.n1,
              ),
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(
              width: 30,
              height: 30,
              child: Image.asset(
                "images/good.png",
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Good',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.n1,
              ),
            ),
          ],
        ),
        Column(
          children: [
            ShaderMask(
              shaderCallback: (Rect bounds) => RadialGradient(
                center: Alignment.topCenter,
                colors: AppColors.g1,
              ).createShader(bounds),
              child: SizedBox(
                width: 30,
                height: 30,
                child: Image.asset(
                  "images/ok.png",
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Ok',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.n1,
              ),
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(
              width: 30,
              height: 30,
              child: Image.asset(
                "images/sad.png",
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Sad',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.n1,
              ),
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(
              width: 30,
              height: 30,
              child: Image.asset(
                "images/angry.png",
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Angry',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.n1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
