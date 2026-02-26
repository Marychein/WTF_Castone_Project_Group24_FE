import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, this.controller, this.label = "Password"});

  final TextEditingController? controller;
  final String label;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: !isVisible,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock, color: Colors.black),
        filled: true,
        fillColor: const  Color(0xFFE4FED9),
        labelText: "",
        labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.black54),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        suffixIcon: IconButton(
          onPressed: () => setState(() => isVisible = !isVisible),
          icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
        ),
      ),
    );
  }
}