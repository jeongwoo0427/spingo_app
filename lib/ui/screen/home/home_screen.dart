import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spingo/app_router.dart';
import 'package:spingo/ui/widget/button/rounded_elevated_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
              child: ElasticIn(
                delay: Duration(milliseconds: 1000),
                child: RoundedElevatedButton(
        onPressed: () {
          context.goNamed(RouteNames.RN_online_play_screen);
        },
        child: Text('온라인 플레이'),
      ),
              ))),
    );
  }
}
