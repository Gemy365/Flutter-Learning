import 'package:flutter/material.dart';

class SecondActivity extends StatefulWidget {
  @override
  _SecondActivityState createState() => _SecondActivityState();
}

class _SecondActivityState extends State<SecondActivity> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Second Activity"),
        backgroundColor: Colors.red,
      ),
    );
  }
}
