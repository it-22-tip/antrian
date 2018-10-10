import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dashboard_icon.dart';
import 'package:xfocus_mobile/animations/slide_right_route.dart';
// import 'package:xfocus_mobile/screen/cash/cash.dart';
import 'package:xfocus_mobile/screen/inventory/inventory.dart';
import 'package:xfocus_mobile/screen/account_payable/account_payable.dart';
import 'package:xfocus_mobile/screen/account_receivable/account_receivable.dart';
import 'package:xfocus_mobile/screen/help/help.dart';
import 'package:xfocus_mobile/screen/sales/sales.dart';
import 'package:xfocus_mobile/screen/check/check.dart';
import 'package:xfocus_mobile/components/app_bar/primary_app_bar.dart';

class DashboardPage extends StatefulWidget {
  final String title;

  DashboardPage({Key key, this.title = ''}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey.shade300,
      appBar: PrimaryAppBar(
        primaryAppBarTitle: 'XFocus Mobile',
        primaryAppBarAutomaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.bell,
            ),
            onPressed: () {
              // TODO On Press
            },
          ),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                children: <Widget>[
                  /* DashboardIcon(
                    title: 'Kas Bank',
                    icon: Icons.account_balance_wallet,
                    onTap: () => Navigator.push(
                          context,
                          SlideRightRoute(
                            widget: CashScreen(),
                          ),
                        ),
                  ), */
                  DashboardIcon(
                    title: 'Persediaan',
                    icon: FontAwesomeIcons.phabricator,
                    onTap: () => Navigator.push(
                          context,
                          SlideRightRoute(
                            widget: InventoryScreen(),
                          ),
                        ),
                  ),
                  DashboardIcon(
                    title: 'Penjualan',
                    icon: Icons.shopping_cart,
                    onTap: () => Navigator.push(
                          context,
                          SlideRightRoute(
                            widget: SalesScreen(),
                          ),
                        ),
                  ),
                  DashboardIcon(
                    title: 'Hutang',
                    icon: FontAwesomeIcons.moneyBillAlt,
                    onTap: () => Navigator.push(
                          context,
                          SlideRightRoute(
                            widget: AccountPayableScreen(),
                          ),
                        ),
                  ),
                  DashboardIcon(
                    title: 'Piutang',
                    icon: FontAwesomeIcons.moneyBillAlt,
                    onTap: () => Navigator.push(
                          context,
                          SlideRightRoute(
                            widget: AccountReceivableScreen(),
                          ),
                        ),
                  ),
                  DashboardIcon(
                    title: 'Bantuan',
                    icon: Icons.help,
                    onTap: () => Navigator.push(
                          context,
                          SlideRightRoute(
                            widget: HelpScreen(),
                          ),
                        ),
                  ),
                  DashboardIcon(
                    title: 'Function Check',
                    icon: Icons.developer_board,
                    onTap: () => Navigator.push(
                          context,
                          SlideRightRoute(
                            widget: CheckScreen(),
                          ),
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
