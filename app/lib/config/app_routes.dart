import 'package:flutter/material.dart';
import '../screen/login/login.dart';
import '../screen/dashboard/dashboard.dart';
// import '../screen/cash/cash.dart';
import '../screen/inventory/inventory.dart';
import '../screen/sales/sales.dart';
import '../screen/help/help.dart';
import '../screen/account_payable/account_payable.dart';
import '../screen/account_receivable/account_receivable.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => LoginScreen(),
  '/dashboard': (context) => DashboardPage(title: 'Dashboard'),
  // '/cash': (context) => CashScreen(),
  '/inventory': (context) => InventoryScreen(),
  '/sales': (context) => SalesScreen(),
  '/account_payable': (context) => AccountPayableScreen(),
  '/account_receivable': (context) => AccountReceivableScreen(),
  '/help': (context) => HelpScreen(),
};
