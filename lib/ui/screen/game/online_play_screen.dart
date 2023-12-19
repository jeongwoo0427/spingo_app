import 'package:flutter/material.dart';
import 'package:spingo/ui/screen/game/widget/spingo_widget.dart';

class OnlinePlayScreen extends StatefulWidget {
  const OnlinePlayScreen({super.key});

  @override
  State<OnlinePlayScreen> createState() => _OnlinePlayScreenState();
}

class _OnlinePlayScreenState extends State<OnlinePlayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity,),
          SpingoWidget(),
        ],
      ),
    );
  }
}
