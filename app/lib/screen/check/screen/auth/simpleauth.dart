import 'package:flutter/material.dart';
import 'package:simple_auth/simple_auth.dart' as simpleAuth;
import 'package:simple_auth_flutter/simple_auth_flutter.dart';
import 'package:xfocus_mobile/components/app_bar/primary_app_bar.dart';

class SimpleauthScreen extends StatefulWidget {
  SimpleauthScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SimpleauthScreenState createState() => _SimpleauthScreenState();
}

class _SimpleauthScreenState extends State<SimpleauthScreen> {
  static String azureClientId = '';
  static String azureTennant = '';
  static String googleClientId = '';
  final simpleAuth.AzureADApi azureApi = simpleAuth.AzureADApi(
      'azure',
      azureClientId,
      'https://login.microsoftonline.com/$azureTennant/oauth2/authorize',
      'https://login.microsoftonline.com/$azureTennant/oauth2/token',
      'https://management.azure.com/');

  final simpleAuth.BasicAuthApi basicApi = simpleAuth.BasicAuthApi(
    'github-basic',
    'https://api.github.com/user',
  );

  final simpleAuth.GoogleApi googleApi =
      simpleAuth.GoogleApi('google', googleClientId);

  @override
  initState() {
    super.initState();
    SimpleAuthFlutter.init(context);
  }

  @override
  Widget build(BuildContext context) {
    SimpleAuthFlutter.context = context;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: PrimaryAppBar(
        primaryAppBarTitle: 'Otentifikasi',
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              'AzureAD OAuth',
              style: Theme.of(context).textTheme.headline,
            ),
          ),
          ListTile(
            leading: Icon(Icons.launch),
            title: Text('Login'),
            onTap: () {
              login(azureApi);
            },
          ),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text('Logout'),
            onTap: () {
              logout(azureApi);
            },
          ),
          ListTile(
            title: Text(
              'Github BasicAuth',
              style: Theme.of(context).textTheme.headline,
            ),
          ),
          ListTile(
            leading: Icon(Icons.launch),
            title: Text('Login'),
            onTap: () async {
              try {
                var success = await basicApi.authenticate();
                showMessage('Logged in success: $success');
              } catch (e) {
                showError(e);
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text('Logout'),
            onTap: () async {
              await basicApi.logOut();
              showMessage('Logged out');
            },
          ),
        ],
      ),
    );
  }

  void showError(dynamic ex) {
    showMessage(ex.toString());
  }

  void showMessage(String text) {
    var alert = AlertDialog(content: Text(text), actions: <Widget>[
      FlatButton(
          child: const Text('Ok'),
          onPressed: () {
            Navigator.pop(context);
          })
    ]);
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  void login(simpleAuth.AuthenticatedApi api) async {
    try {
      var success = await api.authenticate();
      showMessage('Logged in success: $success');
    } catch (e) {
      showError(e);
    }
  }

  void logout(simpleAuth.AuthenticatedApi api) async {
    await api.logOut();
    showMessage('Logged out');
  }
}
