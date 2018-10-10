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
  final double sales;
  final double discount;
  final double tax;
  final double service;
  final double salesReturn;
  Component(
      {this.sales, this.discount, this.tax, this.service, this.salesReturn});
  factory Component.fromJson(Map<String, dynamic> json) {
    return Component(
        sales: json['sales'],
        discount: json['discount'],
        tax: json['tax'],
        service: json['service'],
        salesReturn: json['salesReturn']);
  }
}
