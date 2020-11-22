import 'package:consultant_app/app/pages/home/home_page.dart';
import 'package:consultant_app/app/pages/login/login_page.dart';
import 'package:consultant_app/app/pages/register/register_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.green,
            textTheme: ButtonTextTheme.primary,
          )),
      initialRoute: '/login',
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
      },
    );
  }
}
