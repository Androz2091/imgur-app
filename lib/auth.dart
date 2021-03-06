import 'package:oauth2_client/oauth2_client.dart';
import 'package:oauth2_client/oauth2_helper.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Authentication {
  static OAuth2Client authClient =
      OAuth2Client(
          authorizeUrl: "https://api.imgur.com/oauth2/authorize",
          tokenUrl: "https://api.imgur.com/oauth2/token",
          redirectUri: null,
          customUriScheme: "com.androz2091.imgurapp");

  static OAuth2Helper oauth2Helper =
    OAuth2Helper(authClient,
      grantType: OAuth2Helper.AUTHORIZATION_CODE,
      clientId: env['CLIENT_ID'],
      clientSecret: env['CLIENT_SECRET']);
}