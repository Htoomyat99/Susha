import 'package:flutter/material.dart';

class InputButton extends StatelessWidget {
  final String btnText;
  final void Function() onPress;
  const InputButton({super.key, required this.btnText, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.teal.shade900),
          padding: EdgeInsets.symmetric(vertical: 18),
          child: Center(
            child: Text(
              btnText,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
