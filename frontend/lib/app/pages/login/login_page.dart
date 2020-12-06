import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future checkAuth() async {
    try {
      var sharedPreferencesInstance = await SharedPreferences.getInstance();

      bool isLoggedIn = sharedPreferencesInstance.getBool('isLoggedIn');

      if (isLoggedIn) {
        Navigator.of(context).pushReplacementNamed('/');
      }
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    checkAuth();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    final focus = FocusNode();

    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 66, left: 26, right: 26, bottom: 12),
            child: Column(
              children: [
                Image.asset('assets/logo.png', width: 136),
                SizedBox(height: 42),
                TextFormField(
                  controller: null,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(focus);
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)),
                      labelText: "E-mail",
                      hintText: "Digite seu e-mail"),
                ),
                SizedBox(height: 18),
                TextFormField(
                  controller: null,
                  obscureText: true,
                  focusNode: focus,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)),
                      labelText: "Senha",
                      hintText: "Digite sua senha"),
                ),
                SizedBox(height: 26),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/');
                  },
                  child: Text('LOGIN'),
                ),
                SizedBox(height: 34),
                Text('Não é cadastrado ?'),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed('/register')
                        .then((createdMessage) {
                      if (createdMessage is String) {
                        final snackBar = SnackBar(
                            content: Text(createdMessage),
                            backgroundColor: Colors.green);

                        _scaffoldKey.currentState.showSnackBar(snackBar);
                      }
                    });
                  },
                  child: Text('CADASTRE-SE'),
                  color: Colors.greenAccent,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
