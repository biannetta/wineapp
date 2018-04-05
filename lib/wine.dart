import 'dart:async';
import 'package:firebase_database/firebase_database.dart';

class Wine {
  String name;
  String notes;
  num rating;
  String region;
  String type;

  Wine(this.name, this.notes, this.rating, this.region, this.type);
}

Future <List> getData () async {
  var snap =await FirebaseDatabase.instance.reference().child('wines').once();
  return snap.value;
}
