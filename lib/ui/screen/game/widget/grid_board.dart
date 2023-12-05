import 'package:flutter/material.dart';

class GridBoard extends StatelessWidget {
  const GridBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
          decoration: BoxDecoration(color: colorScheme.surface, boxShadow: const [
            BoxShadow(
                offset: Offset(0.0, 0.0),
                spreadRadius: 5,
                color: Colors.black12,
                blurRadius: 30)
          ]),
          child: const Stack(
            children: [
              Positioned.fill(
                  child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GridHorizontalDivider(),
                  GridHorizontalDivider(),
                  GridHorizontalDivider(),
                ],
              )),
              Positioned.fill(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GridVerticalDivider(),
                      GridVerticalDivider(),
                      GridVerticalDivider()
                    ],
                  ))
            ],
          )),
    );
  }
}

class GridHorizontalDivider extends StatelessWidget {
  const GridHorizontalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Divider(
      height: 0,
      thickness: 2,
      color: colorScheme.onSurface.withOpacity(0.3),
    );
  }
}

class GridVerticalDivider extends StatelessWidget {
  const GridVerticalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return VerticalDivider(
      width: 0,
      thickness: 2,
      color: colorScheme.onSurface.withOpacity(0.3),
    );
  }
}
