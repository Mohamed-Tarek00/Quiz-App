import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.message,
    this.onTap,
    this.width = 223,
    this.hight = 70,
  });

  final String message;
  final void Function()? onTap;
  final double width;
  final double hight;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        width: 223,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              spreadRadius: .2,
              blurRadius: 10,
              color: const Color.fromARGB(255, 174, 174, 255),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 101, 74, 240),
              Color.fromARGB(255, 41, 28, 102),
            ],
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            message,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
