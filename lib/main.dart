import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_database/firebase_database.dart';

import 'winecard.dart';
import 'wine.dart';

final ThemeData kIOSTheme = new ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light
);

final ThemeData kAndroidTheme = new ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.orangeAccent[400]
);

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
      _wines.add(wine);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(
        title: new Text('Wine Club'),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),
      body: new Container(
        child: new CustomScrollView(
          slivers: <Widget>[
            new SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              sliver: new SliverList(
                delegate: new SliverChildBuilderDelegate(
                  (context, index) => new WineCard(_wines[index]),
                  childCount: _wines.length
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}