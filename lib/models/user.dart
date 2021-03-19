class User {
  String _name = "";
  String _userName = "";
  String _city = "";
  String _website = "";
  String _lat = "";
  String _long = "";
  String _phone = "";

  User();

  String get lat => _lat;

  set lat(String value) {
    _lat = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get userName => _userName;

  String get website => _website;

  set website(String value) {
    _website = value;
  }

  String get city => _city;

  set city(String value) {
    _city = value;
  }

  set userName(String value) {
    _userName = value;
  }

  static User fromMap(Map<String, dynamic> userMap) {
    User user = User();
    user._name = userMap["name"];
    user._userName = userMap["username"];
    user._phone = userMap["phone"];
    user._city = userMap["address"]["city"];
    user._website = userMap["website"];
    user._long = userMap["address"]["geo"]["lng"];
    user._lat = userMap["address"]["geo"]["lat"];
    return user;
  }

  String get long => _long;

  set long(String value) {
    _long = value;
  }

  String get phone => _phone;

  set phone(String value) {
    _phone = value;
  }
}
