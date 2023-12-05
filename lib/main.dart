import 'package:flutter/material.dart';
import 'package:spingo/constants/app_themes.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Spingo',
      theme: AppThemes.lightTheme,
      themeMode: ThemeMode.light,
      routerConfig: AppRouter().router,
      builder: (context, child) => ResponsiveBreakpoints.builder(child: child!, breakpoints: [
        const Breakpoint(start: 500, end: double.infinity, name: TABLET),
      ]),

    );
  }
}
