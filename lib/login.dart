import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'utils.dart';
import 'app-scale.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget build(BuildContext context) {
    AppScale scale = AppScale(context);

    return Scaffold(
      appBar: Utils.getAppBar(context, canGoBack: false),
      body: SingleChildScrollView(
          child: Container(
              color: Colors.white,
              child: Container(
                  color: HexColor('#f5f5f5'),
                  width: scale.ofWidth(1),
                  padding: EdgeInsets.fromLTRB(
                      0, scale.ofHeight(0.027), 0, scale.ofHeight(0.027)),
                  child: ElevatedButton(child: Text('Coucou'), onPressed: (){
                    Navigator.pushNamed(context, '/imgur-auth');
                  })
                  ))));
  }
}