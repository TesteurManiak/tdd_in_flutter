import 'package:flutter/material.dart';

class SimpleText extends StatelessWidget {
  final String content;
  final Color color;

  const SimpleText({
    Key? key,
    required this.content, // To avoid updating my constructor I am defining `Colors.red` as a default value.
    this.color = Colors.red,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}
