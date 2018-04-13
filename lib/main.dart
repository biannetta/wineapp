import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_database/firebase_database.dart';

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

  var _wines = [];

  @override
  void initState() {
    super.initState();
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
      body: new StreamBuilder(
        stream: FirebaseDatabase.instance.reference().child('wines').onValue,
        builder: (BuildContext context, AsyncSnapshot<Event> event) {
          if (event.hasError)
            return new Text("Oppsie Poopsie");
          switch (event.connectionState) {
            case ConnectionState.active: {
              Map<String, Map> wines = event.data.snapshot.value;
              wines.forEach((key,value) {
                print(value);
                _wines.add(new Wine.fromJSON(value));
              });
              return new WineList(_wines);
            }
            case ConnectionState.done: return new WineList(_wines);
          }
        },
      ),
    );
  }
}