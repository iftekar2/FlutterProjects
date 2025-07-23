import 'package:flutter/material.dart';

class TextfieldComponent extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator; // Make validator a property

  const TextfieldComponent({
    super.key,
    required this.hintText,
    required this.isPassword,
    required this.textEditingController,
    this.validator, // Add validator to constructor
  });

  @override
  State<TextfieldComponent> createState() => _TextfieldComponentState();
}

class _TextfieldComponentState extends State<TextfieldComponent> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    // Re-added border color logic from previous suggestions for consistency
    final Color actualBorderColor = Colors.grey[800]!;
    final Color actualFocusedBorderColor = Theme.of(context).primaryColor;

    return TextFormField(
      // Use TextFormField for validation
      controller: widget.textEditingController, // Connect controller
      validator: widget.validator, // Use the passed-in validator

      obscureText: widget.isPassword ? _obscureText : false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: actualBorderColor, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: actualBorderColor, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: actualFocusedBorderColor, width: 2.0),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(fontSize: 18, color: Colors.grey[700]),

        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
    );
  }
}
