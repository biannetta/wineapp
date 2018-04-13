import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'theming.dart';
import 'winecard.dart';
import '../models/wine.dart';

class WineList extends StatelessWidget {
  final List<Wine> _wines;

  WineList(this._wines);

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        color: secondaryColour,
        shape: BoxShape.rectangle
      ),
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
    );
  }
}