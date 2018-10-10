import 'dart:convert' as dartJson show json;
import 'cash_model.dart';

class CashData {
  List<dynamic> json;

  CashData({this.json});

  factory CashData.loadJsonString(String data) {
    return CashData(json: CashData.toJson(data));
  }

  factory CashData.loadJson(List data) {
    return CashData(json: data);
  }

  static toJson(String string) {
    return dartJson.json.decode(string);
  }

  CashModel getByYearMonth(int year, int month) {
    var _data1 = CashModelList.fromJson(json);
    var _data2 = _data1.cashData
        .firstWhere((data) => (data.year == year && data.month == month));
    return _data2;
  }

  getMonthComparison() {
    final double _data1 = getByYearMonth(2017, 3).cash;
    final double _data2 = getByYearMonth(2018, 3).cash;
    final String diff = ((_data2 - _data1) / _data2).toStringAsFixed(2);
    final diff2 = num.parse(diff) * 100;
    return diff2;
  }

  double getTotalYearCash(int year) {
    var _data1 = CashModelList.fromJson(json);
    var _data2 = _data1.cashData.where((data) => data.year == year);
    double sum = _data2.fold(0.0, (prev, element) => prev + element.cash);
    return sum;
  }
}
