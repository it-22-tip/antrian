class Model {
  final List<Data> data;
  Model({this.data});
  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
        data: (json['data'] != null)
            ? (json['data'] as List).map((i) => Data.fromJson(i)).toList()
            : null);
  }
}

class Data {
  final int year;
  final int month;
  final int day;
  final DateTime dateTime;
  final Component component;
  Data({this.year, this.month, this.day, this.component, this.dateTime});
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
  final double receivable;
  final double due;
  final double discount;
  final double received;
  Component({this.receivable, this.due, this.discount, this.received});
  factory Component.fromJson(Map<String, dynamic> json) {
    return Component(
        receivable: json['receivable'],
        due: json['due'],
        discount: json['discount'],
        received: json['received']);
  }
}
