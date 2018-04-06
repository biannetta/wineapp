import 'package:flutter/material.dart';

import 'theming.dart';
import '../models/wine.dart';

class WineCard extends StatelessWidget {
  
  final ratingText = new TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold);
  final headerText = new TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.white);
  final footerText = new TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.white);
  final Wine wine;
  
  WineCard(this.wine);

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 150.0,
      margin: new EdgeInsets.all(10.0),
      child: new Column(
        children: <Widget>[
          new Container(
            height: 100.0,
            padding: new EdgeInsets.symmetric(horizontal: 15.0),
            decoration: new BoxDecoration(
              color: secondaryColour,
              shape: BoxShape.rectangle,
            ),
            child: _getWineCardTop()
          ),
          new Container(
            height: 50.0,
            padding: new EdgeInsets.symmetric(horizontal: 15.0),
            decoration: new BoxDecoration(
              color: primaryColour,
              shape: BoxShape.rectangle
            ),
            child: _getWineCardBottom()
          )
        ]
      )
    );
  }

  Widget _getWineCardTop() {
    var ratingColor = Color.lerp(Colors.red[600], Colors.green[600], wine.rating/5);

    return new Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new CircleAvatar(backgroundColor: ratingColor, child: new Text('${wine.rating}',style: ratingText,), radius: 40.0),
        new Text('${wine.name}', style: headerText),
      ],
    );
  }

  Widget _getWineCardBottom() {
    return new Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Icon(Icons.local_drink, color: Colors.purple[50]),
        new Text('${wine.type}', style: footerText),
        new Icon(Icons.pin_drop, color: Colors.purple[50]),
        new Text ('${wine.region}', style: footerText)
      ],
    );
  }
}