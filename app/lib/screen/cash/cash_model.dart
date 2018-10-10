class CashModel {
  final int year;
  final int month;
  final double cash;
  final double pettyCash;

  CashModel({this.year, this.month, this.cash, this.pettyCash});

  factory CashModel.fromJson(Map<String, dynamic> json) {
    return CashModel(
      year: json['year'],
      month: json['month'],
      cash: json['cash'],
      pettyCash: json['petty_cash'],
    );
  }

  get(String props) {
    switch (props) {
      case 'year':
        return year;
        break;
      case 'month':
        return month;
        break;
      case 'cash':
        return cash;
        break;
      case 'pettyCash':
        return pettyCash;
        break;
    }
  }
}

class CashModelList {
  final List<CashModel> cashData;

  CashModelList({
    this.cashData,
  });

  factory CashModelList.fromJson(List<dynamic> json) {
    List<CashModel> cashData = List<CashModel>();
    cashData = json.map((i) => CashModel.fromJson(i)).toList();
    return CashModelList(cashData: cashData);
  }
}
