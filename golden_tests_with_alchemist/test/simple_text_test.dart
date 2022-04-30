import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:golden_tests_with_alchemist/simple_text.dart';

void main() {
  goldenTest(
    'SimpleText Goldens',
    fileName: 'simple_text',
    builder: () => GoldenTestGroup(
      children: [
        GoldenTestScenario(
          name: 'default red text',
          child: const SimpleText(content: 'Hello world!'),
        ),
        GoldenTestScenario(
          name: 'blue text',
          child: const SimpleText(
            content: 'Hello world!',
            color: Colors.blue,
          ),
        ),
      ],
    ),
  );
}
