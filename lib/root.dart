import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:oauth2_client/access_token_response.dart';
import 'imgur.dart';
import 'dart:convert';

class RootPage extends StatefulWidget {
  RootPage();

  @override
  State<StatefulWidget> createState() => new _RootPageState();
}

class ImgurImage {
  String link;

  ImgurImage(this.link);
}

class _RootPageState extends State<RootPage> {

  bool failed = false;
  bool logged = false;
  bool loading = false;
  List<String> links;

  @override
  void initState() {
    super.initState();
  }

  initializeConnection () async {
    MyOAuth2Client client = MyOAuth2Client(
        customUriScheme: 'com.androz2091.imgurapp',
        redirectUri: null
    );

    AccessTokenResponse tknResp = await client.getTokenWithAuthCodeFlow(
    clientId: '9b274a072d497fd',
    clientSecret: 'eabfe02dddfb8156576beb121ae7f87ff34d9ec4').catchError((e) {
      setState(() {
        failed = true;
      });
    });

    setState(() {
      logged = true;
      loading = true;
    });

    var httpClient = http.Client();
    http.Response resp = await httpClient.get('https://api.imgur.com/3/account/me/images',
        headers: {'Authorization': 'Bearer ' + tknResp.accessToken});

    final newLinks = json.decode(resp.body)['data'].map((image) => ImgurImage(image['link']).link);
    setState(() {
      links = new List<String>.from(newLinks.toList());
      loading = false;
    });
  }

  Widget getBody () {
    if (!logged) {
      return ElevatedButton(onPressed: () {
        this.initializeConnection();
      }, child: Text(!failed ? 'Connexion avec Imgur' : 'Echec de la connexion. Cliquez pour réessayer'));
    } else if (loading) {
      return Text('Chargement de vos images...');
    } else if (links.length < 0) {
      return Text('Aucune image à afficher...');
    } else {
      return Container(
          margin: const EdgeInsets.only(top: 10),
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 8.0,
            children: links.map((link) => Image.network(link)).toList()
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Imgur App')
      ),
      body: Center(child: getBody())
    );
  }
}