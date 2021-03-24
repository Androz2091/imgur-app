
import 'package:flutter/material.dart';
import 'package:visa/auth-data.dart';

import 'imgur.dart';

import 'utils.dart';

class AuthPage extends StatelessWidget {
  AuthPage({ Key key }) : super(key: key);

  done (AuthData authData, BuildContext context) {
      print(authData);

      Navigator.pushReplacementNamed(context, '/profile',
          arguments: authData);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: Utils.getAppBar(context),
      body: ImgurAuth().visa.authenticate(
        clientID: '22b72056c347f60',
        clientSecret: 'f90bae7055230fdd43d12143ec9c952fd161269c',
        redirectUri: 'https://www.e-oj.com/oauth',
        scope: 'email',
        state: 'nostate',
        onDone: (authData) {
          done (authData, context);
        }),
    );
  }
}
