import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'ui/theming.dart';
import 'ui/winelist.dart';
import 'models/wine.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Wines',
      theme: defaultTargetPlatform == TargetPlatform.iOS ? kIOSTheme : kAndroidTheme,
      home: new WineApp(),
    );
  }
}

class WineApp extends StatefulWidget {
  @override
  createState() => new WineAppState();
}

class WineAppState extends State<WineApp> {
  List<Wine> _wines = [];

  @override
  void initState() {
    super.initState();
    
    getData().then((onValue) => onValue.forEach((item) {
      Wine wine = new Wine(item['name'], item['notes'], item['rating'], item['region'], item['type']);
      setState((){
        _wines.add(wine);
      });
    }));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(
        backgroundColor: primaryColour,
        title: new Center(
          child: new Text(
            'Wineclub',
            style: new TextStyle(fontSize: 25.0, fontFamily: "Lobster"),
            )
          ),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),
      body: new WineList(_wines),
    );
  }
}