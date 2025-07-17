import 'package:flutter/material.dart';

class SigninOptionsButton extends StatelessWidget {
  final buttonText;
  final buttonImage;
  final VoidCallback onPressed;

  const SigninOptionsButton({
    super.key,
    required this.buttonText,
    required this.buttonImage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 60,
        width: 550,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(buttonImage, width: 30, height: 30),
              ),
              Text(buttonText),
            ],
          ),
        ),
      ),
    );
  }
}
