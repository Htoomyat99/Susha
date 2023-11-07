import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final Widget child;
  const ImageContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(3),
        border: Border.all(color: Colors.white),
      ),
      child: child,
    );
  }
}
