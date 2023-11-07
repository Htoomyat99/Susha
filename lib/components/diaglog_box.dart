import 'package:flutter/material.dart';

class AlertBox extends StatelessWidget {
  final Function() onPressed;
  final String btnText;
  final String contentText;
  const AlertBox(
      {super.key,
      required this.onPressed,
      required this.btnText,
      required this.contentText});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      icon: Icon(
        Icons.warning,
        color: Colors.red.shade800,
        size: 40,
      ),
      content: SizedBox(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              contentText,
              style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  fontSize: 15.5),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade600),
              onPressed: onPressed,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: Text(
                  btnText,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
