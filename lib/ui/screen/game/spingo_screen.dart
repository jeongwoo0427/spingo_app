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
  final GlobalKey _boardKey = GlobalKey();

  Size _boardSize = Size.zero;
  int _linearGridCount = 6;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      //initState 직후 build 전에 미리 위젯을 정의
      _boardSize = _boardKey.currentContext!.size!;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print('SpingoScreen_build : Board width = ${_getBoardSize()?.width}');
    final Size screenSize = MediaQuery.of(context).size;
    ColorScheme colorScheme = Theme.of(context).colorScheme;


    List<Widget> positionedBlocks = [];

    final int _gridCount = _linearGridCount * _linearGridCount;
    final double _gridWidth = _boardSize.width/_linearGridCount;
    final double _gridHeight = _boardSize.height / _linearGridCount;

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

    return ResponsiveScaffold(
      backgroundColor: colorScheme.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(_boardSize.height.toString()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: AspectRatio(
              aspectRatio: 1,
              child: Stack(
                key: _boardKey,
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
