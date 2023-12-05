import 'package:flutter/material.dart';
import 'package:spingo/ui/screen/game/widget/grid_board.dart';
import 'package:spingo/ui/widget/scaffold/responsive_scaffold.dart';

class SpingoScreen extends StatefulWidget {
  const SpingoScreen({super.key});

  @override
  State<SpingoScreen> createState() => _SpingoScreenState();
}

class _SpingoScreenState extends State<SpingoScreen> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return ResponsiveScaffold(
      backgroundColor: colorScheme.background,
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Stack(
                children: [
                  GridBoard(),
                ],
              ))
        ],
      ),
    );
  }
}
