import 'package:flutter/material.dart';
import 'package:spingo/ui/screen/game/widget/spingo_widget.dart';

class OnlinePlayScreen extends StatefulWidget {
  const OnlinePlayScreen({super.key});

  @override
  State<OnlinePlayScreen> createState() => _OnlinePlayScreenState();
}

class _OnlinePlayScreenState extends State<OnlinePlayScreen> {

  final SpingoController _spingoController = SpingoController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
          onPressed: (){_spingoController.spin();},
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity,),
          SpingoWidget(
            controller: _spingoController,
          ),
        ],
      ),
    );
  }
}
