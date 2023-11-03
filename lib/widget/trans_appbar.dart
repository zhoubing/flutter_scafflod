import 'package:flutter/material.dart';

class TransAppBar extends StatefulWidget {
  final ScrollController? controller;

  TransAppBar({this.controller});

  @override
  State<StatefulWidget> createState() {
    return TransAppBarState();
  }
}

class TransAppBarState extends State<TransAppBar> {
  double _opacity = 0;
  Color _textColor = Colors.white;

  @override
  void initState() {
    super.initState();
    widget.controller?.addListener(() {
      double t = widget.controller!.offset / 40;
      setState(() {
        if (t < 0.0) {
          _opacity = 0.0;
          _textColor = Colors.white;
        } else if (t > 1.0) {
          _opacity = 1.0;
          _textColor = Colors.black;
        } else {
          _textColor = Colors.white;
          _opacity = t;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: _opacity,
          child: Container(
            height: 40,
            color: Colors.white,
          ),
        ),
        Container(
          height: 40,
          child: Center(
            child: Text(
              "Title",
              style: TextStyle(color: _textColor),
            ),
          ),
        ),
      ],
    );
  }
}
