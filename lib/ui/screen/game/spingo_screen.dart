import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:spingo/ui/screen/game/widget/grid_board.dart';
import 'package:spingo/ui/screen/game/widget/stone_block.dart';
import 'package:spingo/ui/widget/scaffold/responsive_scaffold.dart';

class SpingoScreen extends StatefulWidget {
  const SpingoScreen({super.key});

  @override
  State<SpingoScreen> createState() => _SpingoScreenState();
}

class _SpingoScreenState extends State<SpingoScreen> {

  final double _maxBoardWidth = 600;
  int _linearGridCount = 6;

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print('SpingoScreen_build : Board width = ${_getBoardSize()?.width}');
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Size screenSize = MediaQuery.of(context).size;
    final Size boardSize = screenSize.width <= _maxBoardWidth ?Size(screenSize.width*0.9,screenSize.width*0.9):Size(_maxBoardWidth,_maxBoardWidth);

    List<Widget> positionedBlocks = [];

    final int _gridCount = _linearGridCount * _linearGridCount;
    final double _gridWidth = boardSize.width/_linearGridCount;
    final double _gridHeight = boardSize.height / _linearGridCount;

    for (int i = 0; i < _gridCount; i++) {
      final int quotient = i ~/ _linearGridCount;


      Widget positionedBlock = Positioned(
          top: _gridHeight*quotient,
          left: _gridWidth*(i-quotient*_linearGridCount),
          child: StoneBlock(
            isBlueStone: true,
            height: _gridHeight,
            width: _gridWidth,
          ));

      positionedBlocks.add(positionedBlock);
    }

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Text(_boardSize.height.toString()),
          SizedBox(width: double.infinity,),
          SizedBox(
            width: boardSize.width,
            child: AspectRatio(
              aspectRatio: 1,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: GridBoard(
                      gridCount: _linearGridCount,
                    ),
                  ),

                  ...positionedBlocks
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
