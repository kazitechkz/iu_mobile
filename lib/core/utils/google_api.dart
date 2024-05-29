import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn(clientId: '63949755595-acts1oa1gimhu5enqufso0qf2si4p7oe.apps.googleusercontent.com');

  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
  static Future<GoogleSignInAccount?> logout() => _googleSignIn.signOut();
}