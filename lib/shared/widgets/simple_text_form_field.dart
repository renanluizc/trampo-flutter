import 'package:flutter/material.dart';

class SimpleTextFormField extends StatelessWidget {
  final String label;
  final Function(String) onSaved;

  const SimpleTextFormField({
    Key key,
    this.label,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        border: InputBorder.none,
      ),
      keyboardType: TextInputType.emailAddress,
      onSaved: onSaved,
    );
  }
}
