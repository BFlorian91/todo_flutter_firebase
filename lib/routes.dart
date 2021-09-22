import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/src/provider.dart';

import './ui/auth/sign_in_screen.dart';
import './ui/todo/todos_screen.dart.dart';

class Routes extends StatefulWidget {
  const Routes({Key? key}) : super(key: key);

  @override
  _RoutesState createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  @override
  Widget build(BuildContext context) {
    final User? firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      // print(
      //   "user is already logged ${firebaseUser.uid} ${firebaseUser.email}!!",
      // );
      return TodoScreen(user: firebaseUser);
    }
    return const SignIn();
  }
}
