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
        if (constraints.maxWidth < 1200 || constraints.maxHeight < 600) {
          return mobile;
        } else {
          return desktop;
        }
      },
    );
  }
}
