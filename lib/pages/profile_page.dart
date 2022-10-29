import 'package:flutter/material.dart';
import 'package:mabesal/pages/edit_profile_page.dart';

import '../profile/widgets/profile_widget.dart';
import '../profile/widgets/user_preferences.dart';
import '../profile/widgets/user_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Theme.of(context).primaryColor, Theme.of(context).colorScheme.secondary]
              ),
          ),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 50.0),
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const EditProfilePage()),
              );
              setState(() {});
            },
          ),
          const SizedBox(height: 30),
          buildName(user),
          buildNrp(user),
          buildTelp(user),
          buildAbout(user),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
    children: [
      Text(
        textAlign: TextAlign.center,
        user.name,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
    ],
  );

  Widget buildAbout(User user) => Container(
    margin: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      border: Border.all(width: 3),
      borderRadius: BorderRadius.circular(15.0)
    ),
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'About',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(
          textAlign: TextAlign.justify,
          user.about,
          style: const TextStyle(fontSize: 16, height: 1.4),
        ),
      ],
    ),
  );

  Widget buildNrp(User user) => Container(
    margin: const EdgeInsets.all(20),
    decoration: BoxDecoration(
        border: Border.all(width: 3),
        borderRadius: BorderRadius.circular(15.0)
    ),
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'NRP',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height:5),
        Text(
          textAlign: TextAlign.justify,
          user.nrp,
          style: const TextStyle(fontSize: 18, height: 1.4),
        ),
      ],
    ),
  );

  Widget buildTelp(User user) => Container(
    margin: const EdgeInsets.all(20),
    decoration: BoxDecoration(
        border: Border.all(width: 3),
        borderRadius: BorderRadius.circular(15.0)
    ),
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Phone',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(
          textAlign: TextAlign.justify,
          user.phone,
          style: const TextStyle(fontSize: 18, height: 1.4),
        ),
      ],
    ),
  );
}