class Wine {
  String name;
  String notes;
  num rating;
  String region;
  String type;

  Wine(this.name, this.notes, this.rating, this.region, this.type);

  Wine.fromJSON(Map jsonMap) {
    this.name = jsonMap['name'];
    this.notes = jsonMap['notes'];
    this.rating = jsonMap['rating'];
    this.region = jsonMap['region'];
    this.type = jsonMap['type'];
  }

  toString() => this.name;
}