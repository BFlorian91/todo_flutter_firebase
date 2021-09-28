import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_firestore/ui/profile/profile.dart';
import 'package:todo_firestore/ui/settings/settings.dart';

import '../providers/auth_provider.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
              color: Colors.pink,
              // image: DecorationImage(
              //   fit: BoxFit.fill,
              //   image: NetworkImage(
              //     'https://wallpaperaccess.com/full/130209.jpg',
              //   ),
              // ),
            ),
          ),
          // ListTile(
          //   leading: const Icon(Icons.input),
          //   title: const Text(
          //     'Welcome',
          //     style: TextStyle(
          //       color: Colors.white70,
          //     ),
          //   ),
          //   onTap: () => {},
          // ),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text(
              'Profile',
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Profile(),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text(
              'Settings',
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Setting(),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text(
              'Logout',
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
            onTap: () {
              authProvider.signOut(context);
            },
          ),
        ],
      ),
    );
  }
}
