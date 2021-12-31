import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  const Demo({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: Text(widget.title)),
    );
  }
}
