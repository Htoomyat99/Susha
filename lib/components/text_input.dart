import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final controller;
  final String placeholder;
  final bool obscureText;

  const TextInput(
      {super.key,
      required this.controller,
      required this.placeholder,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(5)),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          fillColor: Colors.teal.shade200,
          filled: true,
          hintText: placeholder,
        ),
      ),
    );
  }
}
