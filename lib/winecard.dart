import 'package:flutter/material.dart';
import 'wine.dart';

class WineCard extends StatelessWidget {
  
  final Wine wine;
  
  WineCard(this.wine);

  @override
  Widget build(BuildContext context) {
    var ratingColor = Color.lerp(Colors.greenAccent, Colors.green[900], wine.rating/5);
    return new Card(
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new ListTile(
            leading: new CircleAvatar(backgroundColor: ratingColor, child: new Text('${wine.rating}')),
            title: new Text('${wine.name}'),
            subtitle: new Text('${wine.type}'),
          )
        ],
      ),
    );
  }
}