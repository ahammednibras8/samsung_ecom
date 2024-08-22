import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({super.key});

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      cursorColor: Colors.black,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
            width: 1.8,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Colors.white,
        focusColor: Colors.black,
        hintText: 'Phone Number',
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
      ),
      initialCountryCode: "IN",
    );
  }
}
