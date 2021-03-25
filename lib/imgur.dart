import 'package:oauth2_client/oauth2_client.dart';
import 'package:meta/meta.dart';

class MyOAuth2Client extends OAuth2Client {
  MyOAuth2Client({@required String redirectUri, @required String customUriScheme}): super(
    authorizeUrl: 'https://api.imgur.com/oauth2/authorize',
    tokenUrl: 'https://api.imgur.com/oauth2/token',
    redirectUri: redirectUri,
    customUriScheme: customUriScheme
  ) {
      this.accessTokenRequestHeaders = {
        'Accept': 'application/json'
      };
  }
  
}
