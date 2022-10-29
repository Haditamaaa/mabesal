import 'dart:convert';

import 'package:mabesal/profile/widgets/user_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _preferences;

  static const _keyUser = 'user';
  static const myUser = User(
    imagePath:
    'https://e0.365dm.com/22/06/2048x1152/skysports-erling-haaland-man-city_5803257.jpg',
    name: 'Kapten A. Daffa Maulani, S.Kom',
    nrp: '1970231028',
    phone: '+62 85829112276',
    about:
    'Ketua Himatif 2021-2022 \nKepala Bagian Kominfo BEM 2022-2023',
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}