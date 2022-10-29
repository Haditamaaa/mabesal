class User {
  final String imagePath;
  final String name;
  final String nrp;
  final String phone;
  final String about;

  const User({
    required this.imagePath,
    required this.name,
    required this.nrp,
    required this.phone,
    required this.about,
  });

  User copy({
    String? imagePath,
    String? name,
    String? nrp,
    String? phone,
    String? about,
  }) =>
      User(
        imagePath: imagePath ?? this.imagePath,
        name: name ?? this.name,
        nrp: nrp ?? this.nrp,
        phone: phone ?? this.phone,
        about: about ?? this.about,
      );

  static User fromJson(Map<String, dynamic> json) => User(
    imagePath: json['imagePath'],
    name: json['name'],
    nrp: json['nrp'],
    phone: json['phone'],
    about: json['about'],
  );

  Map<String, dynamic> toJson() => {
    'imagePath': imagePath,
    'name': name,
    'nrp': nrp,
    'phone': phone,
    'about': about,
  };
}