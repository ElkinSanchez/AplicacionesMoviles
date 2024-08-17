import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormBuilderCustom extends StatelessWidget {
  final String name;
  final bool obscureText;
  final String hintText;
  final String? Function(String?)? validator;
  final IconData icon;
  final TextInputType keyType;

  const FormBuilderCustom(
      {super.key,
      required this.name,
      required this.obscureText,
      required this.hintText,
      this.validator,
      required this.icon,
      required this.keyType});

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        name: name,
        obscureText: obscureText,
        validator: validator,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          hintText: hintText,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ));
  }
}
