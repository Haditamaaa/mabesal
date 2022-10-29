import 'package:flutter/material.dart';
import 'package:mabesal/common/dashboard_helper.dart';
import 'package:mabesal/pages/profile_page.dart';

import '../common/drawer_helper.dart';

class BerandaPage extends StatefulWidget{
  const BerandaPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BerandaPageState();
  }
}

class _BerandaPageState extends State<BerandaPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Theme.of(context).primaryColor, Theme.of(context).colorScheme.secondary]
              )
          ),
        ),
        leading: Builder(
          builder: (context) {
            return GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: const Icon(Icons.menu),
            );
          }
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 28),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> (const ProfilePage())));
              },
              child: const Icon(Icons.person_pin),
            ),
          ),
        ],
      ),
      drawer: const DrawerWidget(),
      body: const DashboardWidget(),
    );
  }
}
