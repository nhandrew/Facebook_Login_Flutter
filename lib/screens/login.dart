import 'dart:async';

import 'package:facebook_login/blocs/auth_bloc.dart';
import 'package:facebook_login/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}



class _LoginState extends State<Login> {
  StreamSubscription<FirebaseUser> loginStateSubscription;

  @override
  void initState() {
    var authBloc = Provider.of<AuthBloc>(context,listen: false);
    loginStateSubscription = authBloc.currentUser.listen((fbUser) { 
      if (fbUser != null){
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Home())
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    loginStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var authBloc = Provider.of<AuthBloc>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SignInButton(  
              Buttons.Facebook,
              onPressed: () => authBloc.loginFacebook()
            )
          ],
        ),
      ),
    );
  }
}
