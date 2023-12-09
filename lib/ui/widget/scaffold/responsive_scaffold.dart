import 'package:flutter/material.dart';
import 'package:spingo/ui/widget/layout/constrained_layout.dart';

class ResponsiveScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? endDrawer;
  final Color? backgroundColor;
  final double? maxWidth;

  const ResponsiveScaffold(
      {super.key,
      this.appBar,
      this.body,
      this.endDrawer,
      this.backgroundColor,
      this.maxWidth});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: appBar,
        backgroundColor:  backgroundColor,
        body: ConstrainedLayout(child: body??SizedBox()),
    );
  }
}
