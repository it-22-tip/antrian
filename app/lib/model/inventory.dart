class Model {
  final Set<Data> data;
  Model({this.data});
  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
        data: (json['data'] != null)
            ? (json['data'] as List).map((i) => Data.fromJson(i)).toSet()
            : null);
  }
}

class Data {
  final int year;
  final int month;
  final int day;
  final DateTime dateTime;
  final Component component;
  Data({this.year, this.month, this.day, this.dateTime, this.component});
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        year: json['year'],
        month: json['month'],
        day: json['day'],
        dateTime: DateTime(json['year'], json['month'], json['day']),
        component: Component.fromJson(json['component']));
  }
}

class Component {
  final Movement movement;
  Component({this.movement});
  factory Component.fromJson(Map<String, dynamic> json) {
    return Component(movement: Movement.fromJson(json['movement']));
  }
}

class Movement {
  final List<Item> slow;
  final List<Item> fast;
  Movement({this.slow, this.fast});
  factory Movement.fromJson(Map<String, dynamic> json) {
    return Movement(
        slow: (json['slow'] != null)
            ? (json['slow'] as List).map((i) => Item.fromJson(i)).toList()
            : null,
        fast: (json['fast'] != null)
            ? (json['fast'] as List).map((i) => Item.fromJson(i)).toList()
            : null);
  }
}

class Item {
  final String title;
  final double ammount;
  Item({this.title, this.ammount});
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(title: json['title'], ammount: json['ammount']);
  }
}
