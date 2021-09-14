import 'package:flutter/material.dart';

class ErrorMessage extends StatefulWidget {
  final String error;

  const ErrorMessage({Key? key, required this.error}) : super(key: key);

  @override
  State<ErrorMessage> createState() => _ErrorMessageState();
}

class _ErrorMessageState extends State<ErrorMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.error),
      ),
    );
  }
}
