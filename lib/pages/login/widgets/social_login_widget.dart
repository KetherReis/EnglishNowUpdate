import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../routes/routes.dart';

class SocialLoginWidget extends StatefulWidget {
  const SocialLoginWidget({Key? key}) : super(key: key);
  @override
  _SocialLoginState createState() => _SocialLoginState();
}
class _SocialLoginState extends State<SocialLoginWidget> {

  final GoogleSignIn googleSignIn = GoogleSignIn();

  late StreamSubscription<User?> user;


  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> loginGoogleUser() async {
    final GoogleSignInAccount? account = await googleSignIn.signIn();
    final GoogleSignInAuthentication? authentication =
    await account?.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: authentication?.idToken,
        accessToken: authentication?.accessToken);

    final UserCredential authResult = await _auth.signInWithCredential(credential);

    final User? user = authResult.user;

    if (googleSignIn.currentUser?.authentication != null) {
      Navigator.of(context).pushReplacementNamed(Routes.home);
    }
    return user;
  }

  Future<void> loginAppleUser() async {
    final appleIdCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );
    final oAuthProvider = OAuthProvider('apple.com');
    final credential = oAuthProvider.credential(
      idToken: appleIdCredential.identityToken,
      accessToken: appleIdCredential.authorizationCode,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    print(credential);
  }

  @override
  void initState() {
    user = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        Navigator.of(context).pushReplacementNamed(Routes.home);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 80,
        ),
        SignInButtonBuilder(
          icon: Icons.email,
          text: 'Sign in with Google',
          backgroundColor: Colors.blueAccent,
          innerPadding: EdgeInsets.symmetric(horizontal: 20),
          fontSize: 20,
          width: 350,
          height: 50,
          image: Container(
            color: Colors.white,
            width: 45,
            height: 45,
            child: Image.asset('assets/images/logo_google.png',
            ),
          ),
          onPressed: () {
            loginGoogleUser();
          },
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Divider(
                color: Colors.grey,
                endIndent: 20,
              ),
            ),
            Text(
              'Or',
              style: Theme
                  .of(context)
                  .textTheme
                  .subtitle2,
            ),
            Expanded(
              child: Divider(
                color: Colors.grey,
                indent: 20,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        SignInButtonBuilder(
          icon: Icons.email,
          text: 'Sign in with Apple',
          backgroundColor: Colors.black,
          innerPadding: EdgeInsets.symmetric(horizontal: 25),
          fontSize: 20,
          width: 350,
          height: 50,
          image: Container(
            width: 35,
            height: 35,
            child: Image.asset('assets/images/icon_apple.png',
              color: Colors.white,
            ),
          ),
          onPressed: () {
            loginAppleUser();
          },
        ),
        SizedBox(
          height: 130,
        ),
        Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 45),
              child: Text(
                'Your need help? Please, click here: ',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
  }
