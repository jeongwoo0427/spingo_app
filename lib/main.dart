import 'package:flutter/material.dart';
import 'package:spingo/constants/app_themes.dart';
import 'package:spingo/ui/screen/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spingo',
      theme: AppThemes.lightTheme,
      home: HomeScreen()
    );
  }
}
