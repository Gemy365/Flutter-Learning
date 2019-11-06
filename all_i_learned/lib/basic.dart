import 'package:flutter/material.dart';

class MyBasic extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new StateMyBasic();
  }
}

class StateMyBasic extends State<MyBasic> {
  // Object.
  TextEditingController textInputController = new TextEditingController();

  GlobalKey<ScaffoldState> scaffoldState = new GlobalKey<ScaffoldState>();

  // String.
  String Name = "";

  bool myVal = false;

  void VolumeIsOff() {
    print("Volume is off");
  }

  void VolumeIsUp() {
    print("Volume is up");
  }

  void BluetoothShare(int index) {
    if (index == 0)
      print("Blutooth is on");
    else
      print("Share is on");
  }

  void mySubmittedFnc(String name) {
    setState(() {
      Name = name;
    });
  }

  void getTextFromField() {
    setState(() {
      // Get Text From TextField.
      Name = textInputController.text;
    });
  }

  void onChangeSwitch(bool val) {
    setState(() {
      myVal = val;
    });
  }

  // Method for appear an _Alert.
  // hint [ _ ] means private.
  Future<void> _Alert() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert!!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is an Alert!!.'),
                Text('Click Close to close it.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Method for appear a _SnackBar.
  // hint [ _ ] means private.
  void _StaticSnackBar() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return new Container(
            padding: EdgeInsets.all(22.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("This is a static snackbar"),
                new FlatButton(
                    onPressed: () => Navigator.pop(context),
                    child: new Text("Close"))
              ],
            ),
          );
        });
  }

  void DinamicSnackBar() {
    scaffoldState.currentState.showSnackBar(
        new SnackBar(content: new Text("This is a dinamic snackBar")));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: scaffoldState,
        backgroundColor: Colors.white70,
        //Press Ctrl + Alt + Space to know more functions of any widgets.
        appBar: new AppBar(
            title: new Text("All I learned"),
            backgroundColor: Colors.black26,
            actions: <Widget>[
              new IconButton(
                  icon: Icon(Icons.volume_off), onPressed: VolumeIsOff),
              new IconButton(
                  icon: Icon(Icons.volume_up), onPressed: VolumeIsUp),
            ]),
        bottomNavigationBar: new BottomNavigationBar(
            items: [
              new BottomNavigationBarItem(
                  icon: new Icon(Icons.bluetooth),
                  title: new Text("Bluetooth")),
              new BottomNavigationBarItem(
                  icon: new Icon(Icons.share), title: new Text("Share"))
            ],
            backgroundColor: Colors.black26,
            onTap: (int index) => BluetoothShare,
            fixedColor: Colors.white),
        drawer: new Drawer(
            child: new Container(
                alignment: Alignment.bottomCenter,
                height: 60,
                padding: EdgeInsets.all(30.0),
                child: new FlatButton(
                    color: Colors.blueGrey,
                    onPressed: () => Navigator.pop(context),
                    child: new Text("Close!"),
                    textColor: Colors.white))),
        floatingActionButton: new FloatingActionButton(
            onPressed: () => _Alert(),
            backgroundColor: Colors.white,
            tooltip: "Alert!",
            child: new Icon(Icons.warning, color: Colors.red, size: 25)),
        body: new Container(
            padding: EdgeInsets.all(10),
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  new Card(
                    margin: EdgeInsets.all(4),
                      child: new Row(
                          children: <Widget>[new Text(" Hello Mr.$Name")])),
                  new Row(children: <Widget>[
                    Container(
                        width: 200,
                        alignment: Alignment.topLeft,
                        child: new TextField(
                            keyboardType: TextInputType.text,
                            decoration: new InputDecoration(
                                border: new OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    gapPadding: 4.0),
                                contentPadding: EdgeInsets.all(8),
                                icon: new Icon(Icons.person),
                                labelText: "Name",
                                hintText: "Type your name"),
                            controller: textInputController,
                            onSubmitted: mySubmittedFnc)),
                    new SizedBox(width: 20),
                    new Container(
                        alignment: Alignment.topRight,
                        child: new RaisedButton(
                            onPressed: () => getTextFromField(),
                            child: new Text("Send name")))
                  ]),
                  new SwitchListTile(
                      value: myVal,
                      onChanged: onChangeSwitch,
                      title: new Text("Are you agree?",
                          style: new TextStyle(color: Colors.white)),
                      subtitle: new Text("Yes, I agree."),
                      secondary: new Icon(Icons.playlist_add_check,
                          color: Colors.white),
                      activeTrackColor: Colors.red,
                      activeColor: Colors.black),
                  new Container(
                      alignment: Alignment.topRight,
                      child: new RaisedButton(
                          onPressed: _StaticSnackBar,
                          child: new Text("Show a static snackBar!"))),
                  new Container(
                      alignment: Alignment.topRight,
                      child: new RaisedButton(
                          onPressed: DinamicSnackBar,
                          child: new Text("Show a dinamic snackBar!"))),
                  new Container(
                      alignment: Alignment.topRight,
                      child: new RaisedButton(
                          onPressed: () => Navigator.pushNamed(context, "/SecondActivity"),
                          child: new Text("Goto second activity")))
                ])));
  }
}
