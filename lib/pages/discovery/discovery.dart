import 'package:flutter/material.dart';

class DiscoveryPage extends StatefulWidget {
  DiscoveryPage({Key key, this.type}) : super(key: key);
  final String type;
  @override
  _DiscoveryPageState createState() {
    return _DiscoveryPageState();
  }
}

class _DiscoveryPageState extends State<DiscoveryPage> {
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
