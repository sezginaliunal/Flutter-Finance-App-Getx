import 'package:flutter/material.dart';

class TextFormFieldText extends StatelessWidget {
  const TextFormFieldText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.bodySmall);
  }
}
