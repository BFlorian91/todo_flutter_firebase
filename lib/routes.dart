import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:todo_firestore/ui/auth/sign_in_screen.dart';
import 'package:todo_firestore/ui/todo/todos_screen.dart.dart';


class Routes extends StatefulWidget {
  const Routes({Key? key}) : super(key: key);

  @override
  _RoutesState createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  
  @override
  Widget build(BuildContext context) {
    var currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      return const TodoScreen();
    }
    return const SignIn();
  }
}
