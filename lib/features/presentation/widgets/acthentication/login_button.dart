import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(
      {super.key,
      required this.onPressed,
      required this.decoration,
      required this.child});
  final void Function()? onPressed;
  final Decoration? decoration;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      padding: const EdgeInsets.all(0.0),
      child: Ink(
        decoration: decoration,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}
