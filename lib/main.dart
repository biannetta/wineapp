import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:english_words/english_words.dart';

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
      title: 'Startup Name Suggestions',
      theme: defaultTargetPlatform == TargetPlatform.iOS ? kIOSTheme : kAndroidTheme,
      home: new RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = new Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(
        title: new Text('Startup Name Suggestions'),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return new Dismissible(
                key: new Key(pair.asCamelCase),
                background: new Container(
                  alignment: AlignmentDirectional.centerStart,
                  child: new Icon(Icons.star_border, color: Colors.greenAccent[400]),
                  color: Colors.green[200],
                  padding: const EdgeInsets.all(8.0),
                ),
                secondaryBackground: new Container(
                  alignment: AlignmentDirectional.centerEnd,
                  child: new Icon(Icons.delete_forever, color: Colors.redAccent[700]),
                  color: Colors.red[200],
                  padding: const EdgeInsets.all(8.0),
                ),
                child: new ListTile(
                  title: new Text(pair.asPascalCase, style: _biggerFont),
                ),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  setState((){
                    if (direction == DismissDirection.endToStart) {
                      _saved.remove(pair);
                    }
                  });
                },
              );
            }
          );

          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles
          ).toList();

          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
              elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
            ),
            body: new ListView(children: divided),
          );
        }
      )
    );
  }

  Widget _buildRow(WordPair pair) {
    return new Dismissible(
      key: new Key(pair.asCamelCase),
      background: new Container(
        alignment: AlignmentDirectional.centerStart,
        child: new Icon(Icons.star_border, color: Colors.greenAccent[700]),
        color: Colors.green[200],
        padding: const EdgeInsets.all(8.0),
      ),
      secondaryBackground: new Container(
        alignment: AlignmentDirectional.centerEnd,
        child: new Icon(Icons.delete_forever, color: Colors.redAccent[700]),
        color: Colors.red[200],
        padding: const EdgeInsets.all(8.0),
      ),
      child: new ListTile(
        title: new Text(pair.asPascalCase, style: _biggerFont),
      ),
      onDismissed: (direction) {
        _swipeTile(direction, pair);
      },
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
      itemBuilder: (context, i) {
        if (i >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        
        return _buildRow(_suggestions[i]);
      }
    );
  }

  void _swipeTile(DismissDirection direction, WordPair pair) {
    setState((){
      if (direction == DismissDirection.startToEnd) {
        _saved.add(pair);
        _suggestions.remove(pair);
      } else {
        _suggestions.remove(pair);
      }
    });
  }
}