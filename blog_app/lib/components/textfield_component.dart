import 'package:flutter/material.dart';

class TextfieldComponent extends StatefulWidget {
  final String hintText;
  final bool isPassword;

  const TextfieldComponent({
    super.key,
    required this.hintText,
    required this.isPassword,
  });

  @override
  State<TextfieldComponent> createState() => _TextfieldComponentState();
}

class _TextfieldComponentState extends State<TextfieldComponent> {
  bool _obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.isPassword ? _obsecureText : false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0), // Optional: rounded corners
          borderSide: BorderSide(), // Initial border color
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(fontSize: 18, color: Colors.grey[700]),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obsecureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey, // Color of the eye icon
                ),
                onPressed: () {
                  setState(() {
                    _obsecureText = !_obsecureText;
                  });
                },
              )
            : null,
      ),
    );
  }
}
