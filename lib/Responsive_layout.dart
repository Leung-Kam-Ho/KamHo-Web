import 'package:firebasetest/otherUI.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;
  const ResponsiveLayout(
      {Key? key, required this.mobile, required this.desktop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final h = constraints.maxHeight;
        final w = constraints.maxWidth;
        if (h >= 700 && w >= 800) {
          return desktop;
        } else if (h >= 500 && w >= 300) {
          return mobile;
        } else {
          return const OtherUI();
        }
      },
    );
  }
}
