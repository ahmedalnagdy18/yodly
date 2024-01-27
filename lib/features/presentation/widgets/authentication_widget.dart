import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class CircleWidget extends StatefulWidget {
  final void Function(String)? onChange;

  const CircleWidget({super.key, this.onChange});

  @override
  State<CircleWidget> createState() => _CircleWidgetState();
}

class _CircleWidgetState extends State<CircleWidget> {
  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      numberOfFields: 4,

      borderColor: const Color(0xFF512DA8),
      fieldWidth: 55,
      borderRadius: BorderRadius.circular(50),
      keyboardType: TextInputType.number,
      showFieldAsBox: true,
      textStyle: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
      onCodeChanged: widget.onChange,
      // onSubmit: (String verificationCode) {
      //   showDialog(
      //       context: context,
      //       builder: (context) {
      //         return AlertDialog(
      //           title: const Text("Verification Code"),
      //           content: Text('Code entered is $verificationCode'),
      //         );
      //       });
      // }, // end onSubmit
    );
  }
}
