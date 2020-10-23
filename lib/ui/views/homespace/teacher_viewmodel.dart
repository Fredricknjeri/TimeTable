class Teacher {
  int _id;
  String _title;
  String _description;
  String _date;
  int _rank;

  Teacher(this._title, this._rank, this._date, [this._description]);
  Teacher.withId(this._id, this._title, this._rank, this._date,
      [this._description]);

  int get id => _id;
  String get title => _title;
  String get description => _description;
  int get rank => _rank;
  String get date => _date;

  set title(String newTitle) {
    if (newTitle.length <= 255) {
      _title = newTitle;
    }
  }

  set description(String newDescription) {
    if (newDescription.length <= 255) {
      _description = newDescription;
    }
  }

  set date(String newDate) {
    _date = newDate;
  }

  set rank(int newrank) {
    if (newrank > 0 && newrank <= 3) {
      _rank = newrank;
    }
  }

  //transforming the Teacher into a map
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["title"] = _title;
    map["description"] = _description;
    map["rank"] = _rank;
    map["date"] = _date;

    if (_id != null) {
      map["id"] = _id;
    }
    return map;
  }

  //Transform the object into a Teacher
  Teacher.fromObject(dynamic o) {
    this._id = o["id"];
    this._title = o["title"];
    this._description = o["description"];
    this._rank = o["rank"];
    this._date = o["date"];
  }
}
