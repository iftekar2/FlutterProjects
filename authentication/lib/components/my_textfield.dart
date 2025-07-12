import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final String? Function(String?) validator;

  const MyTextfield({
    super.key,
    required this.hintText,
    required this.controller,
    required this.obscureText,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(fontSize: 20),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 20, color: Colors.grey[600]),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
      ),
    );
  }
}

// validator: (value) {
//         if (value!.isEmpty) {
//           return 'Please enter a value';
//         }
//         return null;
//       },
//       controller: controller,
//       obscureText: obscureText,
//       style: TextStyle(fontSize: 20),
//       decoration: InputDecoration(
//         hintText: hintText,
//         hintStyle: TextStyle(fontSize: 20, color: Colors.grey[600]),
//         contentPadding: const EdgeInsets.symmetric(
//           horizontal: 20,
//           vertical: 12,
//         ),
//       ),
