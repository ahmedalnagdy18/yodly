import 'package:flutter/material.dart';
import 'package:yodly/core/colors/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final TextEditingController mycontroller;
  const TextFieldWidget(
      {super.key,
      required this.hintText,
      this.suffixIcon,
      required this.obscureText,
      required this.mycontroller,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: mycontroller,
      decoration: InputDecoration(
          errorStyle: const TextStyle(fontSize: 0.01),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 203, 202, 202)),
          ),
          prefixIcon: prefixIcon,
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.n3,
          )),
    );
  }
}
