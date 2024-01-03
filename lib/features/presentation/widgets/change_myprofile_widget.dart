import 'package:flutter/material.dart';

class ChangeMyProfileTextField extends StatelessWidget {
  const ChangeMyProfileTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 203, 202, 202)),
          ),
          filled: true,
          fillColor: Colors.white,
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class ChangeMyProfileBio extends StatelessWidget {
  const ChangeMyProfileBio({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 115,
            horizontal: 20,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 196, 194, 194)),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
