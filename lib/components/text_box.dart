import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  // controllerUsername is the controller for the text field
  final TextEditingController controllerUsername;
  // errorMessage is the error message for the text field
  final String? errorMessage;

  // hintText
  final String text;

  final String? Function(String?)? validator;

  const MyTextBox({
    super.key,
    required this.controllerUsername,
    required this.errorMessage,
    required this.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllerUsername,
      validator: validator ?? (value) {
        if (value == null || value.isEmpty) {
          return 'Invalid $text';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
        hintText: text,
        hintStyle: const TextStyle(
          fontFamily: 'Arial',
          fontWeight: FontWeight.w300,
          color: Colors.black54,
        ),
        errorText: errorMessage,
      ),
    );
  }
}
