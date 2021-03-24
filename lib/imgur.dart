import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:visa/engine/simple-auth.dart';
import 'package:visa/engine/visa.dart';
import 'package:visa/auth-data.dart';
import 'package:visa/engine/oauth.dart';

/// Enables Imgur [OAuth] authentication
class ImgurAuth implements Visa {
  final baseUrl = 'https://api.imgur.com/oauth2/authorize';
  SimpleAuth visa;

  ImgurAuth() {
    visa = SimpleAuth(
        baseUrl: baseUrl,

        /// Sends a request to the user profile api
        /// endpoint. Returns an AuthData object.
        getAuthData: (Map<String, String> data) async {
          var token = data[OAuth.TOKEN_KEY];
          // User profile API endpoint.
          var baseProfileUrl = 'https://api.imgur.com/3/account/me/images';
          var profileResponse = await http.get(baseProfileUrl, headers: {
            'Authorization': 'Bearer $token',
          });
          var profileJson = json.decode(profileResponse.body);

          return authData(profileJson, data);
        });
  }

  /// This function combines information
  /// from the user [json] and auth response [data]
  /// to build an [AuthData] object.
  @override
  AuthData authData(Map<String, dynamic> json, Map<String, String> data) {
    final String accessToken = data[OAuth.TOKEN_KEY];

    return AuthData(
        clientID: data['clientID'],
        accessToken: accessToken,
        email: json['email'] as String,
        response: data,
        userJson: json);
  }
}
