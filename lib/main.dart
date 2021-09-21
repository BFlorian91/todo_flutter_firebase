import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_firestore/constants/app_themes.dart';
import 'package:todo_firestore/providers/auth_provider.dart';
import 'package:todo_firestore/routes.dart';
import 'package:todo_firestore/ui/auth/register_screen.dart';
import 'package:todo_firestore/ui/todo/todos_screen.dart.dart';
import 'package:todo_firestore/widgets/loading.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
        // StreamProvider(
        //   create: (context) => context.read<AuthProvider>().authStateChanges,
        //   initialData: null,
        // )
      ],
      child: FutureBuilder(
        builder: (BuildContext context, dynamic snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text(
                  snapshot.error,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loading();
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            darkTheme: AppThemes.darkTheme,
            themeMode: ThemeMode.dark,
            routes: <String, WidgetBuilder>{
              '/': (context) => const Routes(),
              '/register': (context) => const RegisterScreen(),
              '/todo': (context) => const TodoScreen(),
            },
            initialRoute: '/',
          );
        },
      ),
    );
  }
}
