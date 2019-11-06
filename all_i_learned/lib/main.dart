import 'package:flutter/material.dart';
import 'package:all_i_learned/basic.dart' as basic;
import 'package:all_i_learned/SecondActivity.dart' as secondActivity;

void main() => runApp(new MaterialApp(home: myApp()));

class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "Main",
      routes: <String, WidgetBuilder>{
        '/BasicActivity': (BuildContext context) => new basic.MyBasic(),
        '/SecondActivity': (BuildContext context) => new secondActivity.SecondActivity()
      },
      home: basic.MyBasic(),
    );
  }

}