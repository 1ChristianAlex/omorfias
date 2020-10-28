import 'package:flutter/material.dart';
import 'package:omorfias/enum/DesignSystem.dart';

class RoundedTextField extends StatelessWidget {
  final void Function(String) onChanged;
  final String Function(String) validator;
  final String placeholder;
  final bool hideText;
  final TextEditingController controller;

  RoundedTextField({
    this.onChanged,
    this.validator,
    this.placeholder,
    this.hideText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        obscureText: hideText ?? false,
        decoration: InputDecoration(
          hintText: placeholder.isNotEmpty ? placeholder : '',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(DesignSystem.rounded),
            ),
          ),
        ),
        validator: validator,
        onChanged: onChanged,
        controller: controller,
      ),
    );
  }
}
