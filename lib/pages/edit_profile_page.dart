
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import '../profile/widgets/button_widget.dart';
import '../profile/widgets/profile_widget.dart';
import '../profile/widgets/textfield_widget.dart';
import '../profile/widgets/user_preferences.dart';
import '../profile/widgets/user_profile.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late User user;

  @override
  void initState() {
    super.initState();

    user = UserPreferences.getUser();
  }
  @override
  Widget build(BuildContext context){
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
              )
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 20.0),
          ProfileWidget(
            imagePath: user.imagePath,
            isEdit: true,
            onClicked: () async {
              final image = await ImagePicker()
                  .getImage(source: ImageSource.gallery);

              if (image == null) return;

              final directory = await getApplicationDocumentsDirectory();
              final name = basename(image.path);
              final imageFile = File('${directory.path}/$name');
              final newImage =
              await File(image.path).copy(imageFile.path);

              setState(() => user = user.copy(imagePath: newImage.path));
            },
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'Name',
            text: user.name,
            onChanged: (name) => user = user.copy(name: name),
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'NRP',
            text: user.nrp,
            onChanged: (nrp) => user = user.copy(nrp: nrp),
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'Phone',
            text: user.phone,
            onChanged: (phone) => user = user.copy(phone: phone),
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'About',
            text: user.about,
            maxLines: 3,
            onChanged: (about) => user = user.copy(about: about),
          ),
          const SizedBox(height: 5,),
          ButtonWidget(
            text: 'Save',
            onClicked: () {
              UserPreferences.setUser(user);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}