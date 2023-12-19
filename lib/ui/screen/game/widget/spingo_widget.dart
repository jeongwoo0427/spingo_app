import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:spingo/ui/screen/game/widget/grid_board.dart';
import 'package:spingo/ui/screen/game/widget/stone_block.dart';
import 'package:spingo/ui/widget/button/rounded_elevated_button.dart';
import 'package:spingo/ui/widget/scaffold/responsive_scaffold.dart';

class SpingoWidget extends StatefulWidget {
  const SpingoWidget({super.key});

  @override
  State<SpingoWidget> createState() => _SpingoWidgetState();
}

class _SpingoWidgetState extends State<SpingoWidget> {
  final double _maxBoardWidth = 600;
  final beltCount = 2;
  late List<List<BlockData>> _blockBelts;
  late List<List<BlockData>> _blockDimensions;


  @override
  void initState() {
    super.initState();

    _initBlockBelts();
    _fetchBlockDimensions();
  }

  void _initBlockBelts() {
    _blockBelts = [
      [
        BlockData(valueNo: 1, state: BlockState.none), //0,0
        BlockData(valueNo: 2, state: BlockState.none), //0,1
        BlockData(valueNo: 3, state: BlockState.none), //0,2
        BlockData(valueNo: 4, state: BlockState.blue), //0,3
      ],
      [
        BlockData(valueNo: 5, state: BlockState.none), //1,0
        BlockData(valueNo: 6, state: BlockState.none), //1,1
        BlockData(valueNo: 7, state: BlockState.none), //1,2
        BlockData(valueNo: 8, state: BlockState.none), //1,3
        BlockData(valueNo: 9, state: BlockState.blue), //1,4
        BlockData(valueNo: 10, state: BlockState.none), //1,5
        BlockData(valueNo: 11, state: BlockState.none), //1,6
        BlockData(valueNo: 12, state: BlockState.none), //1,7
        BlockData(valueNo: 13, state: BlockState.none), //1,8
        BlockData(valueNo: 14, state: BlockState.none), //1,9
        BlockData(valueNo: 15, state: BlockState.blue), //1,10
        BlockData(valueNo: 16, state: BlockState.blue), //1,11
      ]
    ];
  }

  void _fetchBlockDimensions() {
    _blockDimensions = [
      [
        _blockBelts[1][0], //5
        _blockBelts[1][1], //6
        _blockBelts[1][2], //7
        _blockBelts[1][3], //8
      ],
      [
        _blockBelts[1][11], //16
        _blockBelts[0][0], //1
        _blockBelts[0][1], //2
        _blockBelts[1][4], //9
      ],
      [
        _blockBelts[1][10], //15
        _blockBelts[0][3], //4
        _blockBelts[0][2], //3
        _blockBelts[1][5], //10
      ],
      [
        _blockBelts[1][9], //14
        _blockBelts[1][8], //13
        _blockBelts[1][7], //12
        _blockBelts[1][6], //11
      ]
    ];

    // int blockValue = 1;
    // for (int y = 0; y < _linearGridCount; y++) {
    //   final List<BlockData> row = [];
    //   for (int x = 0; x < _linearGridCount; x++) {
    //     row.add(BlockData(valueNo: blockValue, state: BlockState.red));
    //     blockValue++;
    //   }
    //   _blockDimensions.add(row);
    // }
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
    int _linearGridCount = _blockDimensions[0].length;

    final int _gridCount = _linearGridCount * _linearGridCount;
    final double _gridWidth = boardSize.width / _linearGridCount;
    final double _gridHeight = boardSize.height / _linearGridCount;

    for (int i = 0; i < _gridCount; i++) {
      final int yPosition = i ~/ _linearGridCount; //qoutient
      final int xPosition = (i - yPosition * _linearGridCount);
      final BlockData blockData = _blockDimensions[yPosition][xPosition];

      Widget positionedBlock = AnimatedPositioned(
        key: ValueKey<int>(blockData.valueNo),
        curve: Curves.ease,
        top: _gridHeight * yPosition,
        left: _gridWidth * xPosition,
        duration: Duration(milliseconds: 400),
        child: StoneBlock(
          stoneData: _blockDimensions[yPosition][xPosition],
          height: _gridHeight,
          width: _gridWidth,
          onTap: (){
            setState(() {
              _blockDimensions[yPosition][xPosition].state = BlockState.blue;
            });
            _spin();
          },
        ),
      );

      positionedBlocks.add(positionedBlock);
    }

    return    SizedBox(
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
    );
  }

  void _spin() {

    final BlockData blockData1 = _blockBelts[0].last;
    _blockBelts[0].removeLast();
    _blockBelts[0].insert(0, blockData1);

    final BlockData blockData2 = _blockBelts[1][0];
    _blockBelts[1].removeAt(0);
    _blockBelts[1].add(blockData2);

    _fetchBlockDimensions();

    setState(() {});
  }
}