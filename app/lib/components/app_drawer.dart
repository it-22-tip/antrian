import 'package:flutter/material.dart';

var drawerHeader = UserAccountsDrawerHeader(
  accountName: Text('App User Name'),
  accountEmail: Text('User Email'),
  currentAccountPicture: CircleAvatar(
    backgroundColor: Colors.grey,
    child: Text('U'),
  ),
);

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          drawerHeader,
          ListTile(
            title: Text('Dashboard'),
            trailing: Icon(Icons.dashboard),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/dashboard');
            },
          ),
        ],
      ),
    );
  }
}
