import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:yodly/core/colors/app_colors.dart';

class OtpWidget extends StatelessWidget {
  const OtpWidget({super.key, required this.controller});
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Pinput(
      controller: controller,
      defaultPinTheme: PinTheme(
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: Colors.grey,
            ),
          )),
      keyboardType: TextInputType.number,
      length: 4,
      focusedPinTheme: PinTheme(
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: AppColors.p2,
            ),
          )),
      textInputAction: TextInputAction.next,
    );
  }
}
