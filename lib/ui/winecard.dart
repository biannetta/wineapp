import 'package:flutter/material.dart';

import 'theming.dart';
import '../models/wine.dart';

class WineCard extends StatelessWidget {
  
  final ratingText = new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold);
  final headerText = new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white);
  final footerText = new TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.white);
  final Wine wine;
  
  WineCard(this.wine);

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 120.0,
      margin: new EdgeInsets.all(10.0),
      decoration: new BoxDecoration(
        color: primaryLightColour,
        shape: BoxShape.rectangle,
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
      child: new Column(
        children: <Widget>[
          new Container(
            height: 80.0,
            padding: new EdgeInsets.symmetric(horizontal: 15.0),
            child: _getWineCardTop()
          ),
          new Container(
            height: 40.0,
            padding: new EdgeInsets.symmetric(horizontal: 15.0),
            child: _getWineCardBottom()
          )
        ]
      )
    );
  }

  Widget _getWineCardTop() {
    return new Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        new Expanded(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text('${wine.name}', style: headerText, overflow: TextOverflow.ellipsis,),
              new Text('${wine.type}', style: footerText, overflow: TextOverflow.ellipsis,),
            ],
          ),
        ),
        new Icon(Icons.star, color: Colors.amberAccent,),
        new Text('${wine.rating}', style: headerText,)
      ]
    );
  }

  Widget _getWineCardBottom() {
    return new Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
       new Expanded(
          child: new Row(
            children: <Widget>[
              new Icon(Icons.pin_drop, color: Colors.purple[50]),
              new Text ('${wine.region}', style: footerText)
            ],
          ),
        )
      ],
    );
  }
}