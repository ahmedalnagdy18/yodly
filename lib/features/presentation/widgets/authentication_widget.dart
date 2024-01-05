import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  const CircleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.grey)),
        clipBehavior: Clip.antiAlias,
        width: 50,
        height: 50,
        child: Center(
          child: TextField(
            onChanged: (value) {
              FocusScope.of(context).nextFocus();
            },
            textAlign: TextAlign.center,
            keyboardType: TextInputType.phone,
            maxLength: 1,
            showCursor: false,
            decoration: const InputDecoration(
              counterText: "",
            ),
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
