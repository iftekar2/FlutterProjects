import 'package:flutter/material.dart';

class SigninOptionsButton extends StatelessWidget {
  final String buttonText;
  final String buttonImage;
  final VoidCallback onPressed;

  const SigninOptionsButton({
    super.key,
    required this.buttonText,
    required this.buttonImage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: BorderSide(color: Colors.grey.withOpacity(0.3), width: 1),
          ),
          elevation: 0,
          shadowColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Image.asset(buttonImage, width: 35, height: 35),
              ),
            ),
            Text(
              buttonText,
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
