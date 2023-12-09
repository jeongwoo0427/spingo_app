import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spingo/constants/app_themes.dart';

class StoneBlock extends StatelessWidget {
  final bool isBlueStone;
  final double height;
  final double width;

  const StoneBlock(
      {super.key,
      required this.isBlueStone,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(300),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isBlueStone
                  ? AppColors.blueStoneColor
                  : AppColors.redStoneColor,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0.0, 0.0),
                    color: Colors.black12,
                    blurRadius: 3,
                    spreadRadius: 3)
              ]),
        ),
      ),
    );
  }
}
