import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const Expanded(
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: Form(
                        key: _formKey,
                        child: ListView(
                          children: [
                            TextFormField(
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.white70,
                                ),
                                labelText: 'Enter Email',
                              ),
                              controller: emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter an email';
                                } else if (!value.contains('@')) {
                                  return 'Please enter an valid email';
                                }
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.white70,
                                ),
                                suffixIcon: Icon(Icons.visibility,
                                    color: Colors.white70),
                                labelText: 'Enter Password',
                              ),
                              obscureText: true,
                              controller: passwordController,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: TextButton(
                        child: const Text('Sign In'),
                        onPressed: () {
                          if (emailController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty) {
                            authProvider.signIn(
                              emailController.text,
                              passwordController.text,
                              context,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "OR login with",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Container(
                height: 300,
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        // IconButton(onPressed: () {}, icon: ) // Google SignIn etc... here
                        Container(
                          child: const Center(
                            child: Text(
                              'Google',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ),
                          width: 65,
                          height: 65,
                          decoration: const ShapeDecoration(
                            color: Colors.red,
                            shape: CircleBorder(
                              side: BorderSide(
                                width: 10,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 65,
                          height: 65,
                          child: const Center(
                            child: Text(
                              'Apple',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ),
                          decoration: const ShapeDecoration(
                            color: Colors.red,
                            shape: CircleBorder(
                              side: BorderSide(
                                width: 10,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 65,
                          height: 65,
                          child: const Center(
                            child: Text(
                              'Email',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ),
                          decoration: const ShapeDecoration(
                            color: Colors.red,
                            shape: CircleBorder(
                              side: BorderSide(
                                width: 10,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: MaterialButton(
                    onPressed: () =>
                        Navigator.of(context).pushReplacementNamed('/register'),
                    child: const Text(
                      "Don't have an account? Register",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
