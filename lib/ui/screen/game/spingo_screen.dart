import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:spingo/ui/screen/game/widget/grid_board.dart';
import 'package:spingo/ui/screen/game/widget/stone_block.dart';
import 'package:spingo/ui/widget/button/rounded_elevated_button.dart';
import 'package:spingo/ui/widget/scaffold/responsive_scaffold.dart';

class SpingoScreen extends StatefulWidget {
  const SpingoScreen({super.key});

  @override
  State<SpingoScreen> createState() => _SpingoScreenState();
}

class _SpingoScreenState extends State<SpingoScreen> {
  final double _maxBoardWidth = 600;
  int _linearGridCount = 4;

  late List<List<BlockData>> _blockDatas;

  @override
  void initState() {
    super.initState();

    _initBlockDatas();
  }


  void _initBlockDatas() {
    _blockDatas = [];
    int blockValue = 1;
    for(int y = 0 ; y < _linearGridCount; y++){
      final List<BlockData> row = [];
      for(int x = 0; x<_linearGridCount; x++){
        row.add(BlockData(valueNo: blockValue, state: BlockState.red));
        blockValue++;
      }
      _blockDatas.add(row);
    }
  }

  @override
  Widget build(BuildContext context) {
    //print('SpingoScreen_build : Board width = ${_getBoardSize()?.width}');
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Size screenSize = MediaQuery.of(context).size;
    final Size boardSize = screenSize.width <= _maxBoardWidth
        ? Size(screenSize.width * 0.9, screenSize.width * 0.9)
        : Size(_maxBoardWidth, _maxBoardWidth);

    List<Widget> positionedBlocks = [];

    final int _gridCount = _linearGridCount * _linearGridCount;
    final double _gridWidth = boardSize.width / _linearGridCount;
    final double _gridHeight = boardSize.height / _linearGridCount;

    for (int i = 0; i < _gridCount; i++) {
      final int yPosition = i ~/ _linearGridCount; //qoutient
      final int xPosition = (i - yPosition * _linearGridCount);
      final BlockData blockData = _blockDatas[yPosition][xPosition];

      Widget positionedBlock = AnimatedPositioned(
        key: ValueKey<int>(blockData.valueNo),
        top: _gridHeight * yPosition,
        left: _gridWidth * xPosition,
        duration: Duration(milliseconds: 300),
        child: StoneBlock(
          stoneData: _blockDatas[yPosition][xPosition],
          height: _gridHeight,
          width: _gridWidth,
        ),
      );

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
          SizedBox(
            width: double.infinity,
          ),
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
          ),
          SizedBox(height: 100,),
          RoundedElevatedButton(onPressed:_spin, child: Text('Shake'))
        ],
      ),
    );
  }


  void _spin() {
    final BlockData blockData1 = _blockDatas[1][2];
    final BlockData blockData2 = _blockDatas[1][3];
    _blockDatas[1][3] = blockData1;
    _blockDatas[1][2] = blockData2;
    setState(() {

    });
  }
}
