import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String? label;

  const CustomTextField({this.label, Key? key}) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: widget.label,
      ),
    );
  }
}
