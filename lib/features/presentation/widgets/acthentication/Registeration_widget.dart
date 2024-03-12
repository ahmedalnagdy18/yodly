import 'package:flutter/material.dart';
import 'package:yodly/core/colors/app_colors.dart';

class RIcon extends StatelessWidget {
  const RIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          clipBehavior: Clip.antiAlias,
          width: 50,
          height: 50,
          child: Image.asset(
            'images/Facebook.png',
            scale: 3,
          ),
        ),
        const SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          clipBehavior: Clip.antiAlias,
          width: 50,
          height: 50,
          child: Image.asset(
            'images/Apple.png',
            scale: 3,
          ),
        ),
        const SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          clipBehavior: Clip.antiAlias,
          width: 50,
          height: 50,
          child: Image.asset(
            'images/Google.png',
            scale: 3,
          ),
        ),
      ],
    );
  }
}

class RDvider extends StatelessWidget {
  const RDvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      const Expanded(child: Divider(thickness: 2)),
      const SizedBox(width: 20),
      Text("OR",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.n1,
          )),
      const SizedBox(width: 20),
      const Expanded(child: Divider(thickness: 2)),
    ]);
  }
}
