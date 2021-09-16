import 'package:flutter/material.dart';

import 'package:todo_firestore/widgets/custom_text_field.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const CustomTextField(label: "Enter Email"),
                  const CustomTextField(label: "Enter Password"),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: TextButton(
                      child: const Text('Sign In'),
                      onPressed: () =>
                          Navigator.of(context).pushReplacementNamed('/todo'),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "OR login with",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: <Widget>[
                  Row(
                    children: const <Widget>[
                      // IconButton(onPressed: () {}, icon: ) // Google SignIn etc... here
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
