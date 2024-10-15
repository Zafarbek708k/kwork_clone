
import 'package:flutter/material.dart';
import 'package:kwork_clone/src/core/constants/context_extension.dart';

class AuthMainTextField extends StatefulWidget {
  const AuthMainTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.isPassword = false, // New flag to determine if the field is for a password
  });

  final TextEditingController controller;
  final String? hintText;
  final bool isPassword;

  @override
  State<AuthMainTextField> createState() => _AuthMainTextFieldState();
}

class _AuthMainTextFieldState extends State<AuthMainTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false, // Only obscure text for passwords
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
            color: context.appTheme.primary
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: _obscureText
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText; // Toggle visibility
            });
          },
        )
            : null, // No suffix icon for email
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        filled: true,
        fillColor: Colors.grey[200],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: Colors.grey.shade700),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}

