import 'package:flutter/material.dart';

class TextfieldComponent extends StatelessWidget {
  final String hintText;
  const TextfieldComponent({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0), // Optional: rounded corners
          borderSide: BorderSide(), // Initial border color
        ),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 18, color: Colors.grey[700]),
      ),
    );
  }
}
