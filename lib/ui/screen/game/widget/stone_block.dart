import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spingo/constants/app_themes.dart';

enum BlockState { red, blue, none }

class BlockData {
  final int valueNo; //stone을 구분하기 위한 unique 한 값
  BlockState state;

  BlockData({required this.valueNo, required this.state});
}

class StoneBlock extends StatelessWidget {
  final BlockData stoneData;
  final double height;
  final double width;
  final void Function() onTap;

  const StoneBlock(
      {super.key,
      required this.stoneData,
      required this.height,
      required this.width,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    Widget stone = SizedBox();

    if (stoneData.state == BlockState.red ||
        stoneData.state == BlockState.blue) {
      stone = Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: stoneData.state == BlockState.red
                ? AppColors.redStoneColor
                : AppColors.blueStoneColor,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0.0, 0.0),
                  color: Colors.black12,
                  blurRadius: 3,
                  spreadRadius: 3)
            ]),
      );
    }

    return SizedBox(
      height: height,
      width: width,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: stoneData.state == BlockState.none ? onTap : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(300),
                child: stone),
          ),
        ),
      ),
    );
  }
}
