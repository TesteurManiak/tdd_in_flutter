import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:testing_your_widgets/simple_text.dart';

void main() {
  testGoldens('golden: simple red text', (tester) async {
    // Load fonts to allow text and icon rendering.
    await loadAppFonts();

    // Render the widget by wrapping it in a MaterialApp.
    await tester.pumpWidget(
      createApp(const SimpleText(content: 'Test content')),
    );

    // Compare the snapshot to the golden file.
    await screenMatchesGolden(tester, 'simple_red_text');
  });

  testGoldens('golden: simple blue text', (tester) async {
    await loadAppFonts();
    await tester.pumpWidget(
      createApp(
        const SimpleText(
          content: 'Test content',
          color: Colors.blue, // let's try with a blue text.
        ),
      ),
    );
    await screenMatchesGolden(tester, 'simple_blue_text');
  });
}

/// Will return the [child] widget centered inside a `MaterialApp` and a
/// `Scaffold`.
Widget createApp(Widget child) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(body: Center(child: child)),
  );
}
