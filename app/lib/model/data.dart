class Data {
  final int year;
  final int month;
  final int day;
  final DateTime dateTime;
  Data({
    this.year,
    this.month,
    this.day,
    this.dateTime,
  });
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      year: json['year'],
      month: json['month'],
      day: json['day'],
      dateTime: DateTime(json['year'], json['month'], json['day']),
    );
  }
}
