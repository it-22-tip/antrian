class Model {
  final Set<Data> data;
  Model({this.data});
  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
        data: (json['data'] != null)
            ? (json['data'] as List).map((i) => Data.fromJson(i)).toSet()
            : null);
  }

  cashDual({year, month, day}) {
    double debit;
    double credit;
    final dataWhere = data.where((data) => (data.year == year));
    credit = dataWhere
        .where((data) => (data.component.cash < 0))
        .fold<double>(0.00, (prev, data) => prev + data.component.cash);
    debit = dataWhere
        .where((data) => (data.component.cash > 0))
        .fold<double>(0.00, (prev, data) => prev + data.component.cash);
    return {'debit': debit, 'credit': credit};
  }

  cashDebit({year, month, day}) {
    return cashDual(year: year, month: month, day: day)['debit'];
  }

  cashCredit({year, month, day}) {
    return cashDual(year: year, month: month, day: day)['credit'];
  }

  cashTotal({year, month, day}) {
    return data.where((data) => (data.year == year)).fold<double>(0.0,
        (prev, data) {
      final cash = data.component.cash;
      final bank = (data.component.bank != null)
          ? data.component.bank
              .fold<double>(0.0, (prev, bank) => prev + bank.value)
          : 0.0;
      return prev + cash + bank;
    });
  }

  cashDate() {
    return data.first.dateTime.toString();
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
        component: Component.fromJson(json['components']));
  }
}

class Component {
  final double cash;
  final Set<Bank> bank;
  Component({this.cash, this.bank});
  factory Component.fromJson(Map<String, dynamic> json) {
    return Component(
      cash: json['cash'],
      bank: (json['bank'] != null)
          ? (json['bank'] as List).map((i) => Bank.fromJson(i)).toSet()
          : null,
    );
  }
}

class Bank {
  final int id;
  final double value;
  Bank({this.id, this.value});

  /// Json to [id] & [value]
  ///
  /// return [Set]
  factory Bank.fromJson(Map<String, dynamic> json) {
    return Bank(id: json['id'], value: json['value']);
  }
}
