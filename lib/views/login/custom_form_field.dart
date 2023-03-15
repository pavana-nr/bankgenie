import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    required this.hintText,
    this.inputFormatters,
    this.validator,
    this.isPassword,
    this.controller,
  }) : super(key: key);
  final String hintText;
  final bool? isPassword;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        inputFormatters: inputFormatters,
        obscureText: isPassword ?? false,
        validator: validator,
        decoration: InputDecoration(hintText: hintText),
      ),
    );
  }
}
