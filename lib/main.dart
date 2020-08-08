import 'package:facebook_login/blocs/auth_bloc.dart';
import 'package:facebook_login/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
          create: (context) => AuthBloc(),
          child: MaterialApp(
        title: 'Facebook Login',
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Login(),
      ),
    );
  }
}

