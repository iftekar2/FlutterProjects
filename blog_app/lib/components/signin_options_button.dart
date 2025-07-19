import 'package:flutter/material.dart';

class SigninOptionsButton extends StatelessWidget {
  final String buttonText;
  final String buttonImage;
  final VoidCallback onPressed;
  final double imageHeight;
  final double imageWidth;

  const SigninOptionsButton({
    super.key,
    required this.buttonText,
    required this.buttonImage,
    required this.onPressed,
    this.imageHeight = 35,
    this.imageWidth = 35,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xffedefef),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: BorderSide(
              color: const Color.fromARGB(255, 128, 128, 128).withOpacity(0.3),
              width: 1,
            ),
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
              child: Image.asset(
                buttonImage,
                width: imageWidth,
                height: imageHeight,
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
