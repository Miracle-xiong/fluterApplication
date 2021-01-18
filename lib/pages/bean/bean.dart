import 'package:flutter/material.dart';

class BeanPage extends StatefulWidget {
  BeanPage({Key key, this.type}) : super(key: key);
  final String type;
  @override
  _BeanPageState createState() {
    return _BeanPageState();
  }
}

class _BeanPageState extends State<BeanPage> {
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
