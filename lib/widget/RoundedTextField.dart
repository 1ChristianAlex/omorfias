import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  final void Function(String) onChanged;
  final String Function(String) validator;
  final String placeholder;

  RoundedTextField({this.onChanged, this.validator, this.placeholder});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: placeholder.isNotEmpty ? placeholder : '',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(22),
            ),
          ),
        ),
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}
