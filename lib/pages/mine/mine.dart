import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  MinePage({Key key, this.type}) : super(key: key);
  final String type;
  @override
  _MinePageState createState() {
    return _MinePageState();
  }
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.type),
      ),
      body: Center(
        child: Text(widget.type),
      ),
    );
  }
}
