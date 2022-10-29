import 'package:flutter/material.dart';
import 'package:mabesal/pages/beranda_page.dart';
import 'package:mabesal/pages/profile_page.dart';

import '../pages/splash_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _drawerHeader(),
          _drawerItem(
              icon: Icons.home_rounded,
              text: 'Home',
              onTap: () {Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> (const BerandaPage())));
              }
          ),
          const Divider(height: 25, thickness: 1),
          _drawerItem(
              icon: Icons.person,
              text: 'My Profile',
              onTap: () {Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> (const ProfilePage())));
              }
          ),
          const Divider(height: 25, thickness: 1),
          _drawerItem(
              icon: Icons.logout,
              text: 'Logout',
              onTap: () {Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> (const SplashScreen(title: 'logout',))));
              }
          ),
          const Divider(height: 25, thickness: 1),
        ],
      ),
    );
  }
}

Widget _drawerHeader() {
  return const UserAccountsDrawerHeader(
    decoration: BoxDecoration(
        color: Colors.blueAccent
    ),
    currentAccountPicture: CircleAvatar(
      backgroundColor: Colors.blueAccent,
      backgroundImage: AssetImage('images/image1.png'),
    ),
    accountName: Text('Ahmad Daffa Maulani'),
    accountEmail: Text('maschen@gmail.com'),
  );
}

Widget _drawerItem({IconData? icon, String? text, GestureTapCallback? onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            text!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    onTap: onTap,
  );
}