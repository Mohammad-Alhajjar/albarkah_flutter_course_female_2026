import 'package:flutter/material.dart';
import 'package:resposive_adaptive/views/desktop_layout.dart';
import 'package:resposive_adaptive/views/mobile_layout.dart';
import 'package:resposive_adaptive/views/tablet_layout.dart';

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 600 || constraints.maxHeight < 600) {
          return MobileLayout();
        } else if (constraints.maxWidth < 900) {
          return TabletLayout();
        } else {
          return DesktopLayout();
        }
      },
    );
  }
}
