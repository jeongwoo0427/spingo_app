import 'package:flutter/material.dart';
import 'package:spingo/ui/widget/button/rounded_elevated_button.dart';

class TestScreen extends StatefulWidget {
  TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  bool toggleShake = false;

  @override
  Widget build(BuildContext context) {

    List<Widget> positionedBlocks = [
      AnimatedPositioned(
        key: ValueKey<int>(toggleShake?1:2),
          left: 10,
          top: 100,
          child: Container(
            child: Text('1'),
            height: 80,
            width: 80,
            color: toggleShake? Colors.red: Colors.blue,
          ),
          duration: Duration(milliseconds: 500)),
      AnimatedPositioned(
        key: ValueKey<int>(toggleShake?2:1),
          left: 100,
          top: 100,
          child: Container(
            child: Text('2'),
            height: 80,
            width: 80,
            color: toggleShake? Colors.blue: Colors.red,
          ),
          duration: Duration(milliseconds: 500))
    ];

    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 600,
          child: Stack(
            children: [
              ...positionedBlocks
            ],
          ),
        ),
        RoundedElevatedButton(onPressed: () {
          setState(() {
            toggleShake = !toggleShake;
          });
        }, child: Text('Shake'))
      ],
    ));
  }
}
