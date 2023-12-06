import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spingo/constants/app_themes.dart';

class Stone extends StatelessWidget {
  final isBlueStone;

  const Stone({super.key, required this.isBlueStone});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(300),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isBlueStone?AppColors.blueStoneColor:AppColors.redStoneColor,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0.0, 0.0),
                  color: Colors.black12,
                  blurRadius: 3,
                  spreadRadius: 3)
            ]),
      ),
    );
  }
}
