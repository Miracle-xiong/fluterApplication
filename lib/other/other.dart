import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OtherPage extends StatefulWidget {
  OtherPage({Key key, @required this.title, @required this.movieID})
      : super(key: key);
  final String title;
  final int movieID;
  @override
  _OtherPageState createState() {
    return _OtherPageState();
  }
}

class _OtherPageState extends State<OtherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text('${widget.title}--- id ${widget.movieID}'),
      ),
    );
  }
}
