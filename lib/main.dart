import 'package:flutter/material.dart';
import 'login.dart';
import 'auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => LoginPage(),
        '/imgur-auth': (BuildContext context) => AuthPage()
      }
    );
  }
}
