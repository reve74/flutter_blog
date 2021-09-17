import 'package:flutter/material.dart';

class CustomTextArea extends StatelessWidget {

  final String hint;
  final funvalidator;
  final String? value;

  const CustomTextArea(
      {required this.hint, required this.funvalidator, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        initialValue: value ?? "",
        maxLines: 10,
        validator: funvalidator,
        decoration: InputDecoration(
          hintText: "Enter $hint",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
    );
  }
}
