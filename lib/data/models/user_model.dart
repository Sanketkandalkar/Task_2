class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final int age;
  final String city;
  final String country;
  final String profileImageUrl;
  final String largeImageUrl;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.city,
    required this.country,
    required this.profileImageUrl,
    required this.largeImageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['login']['uuid'] ?? '',
      firstName: json['name']['first'] ?? '',
      lastName: json['name']['last'] ?? '',
      age: json['dob']['age'] ?? 0,
      city: json['location']['city'] ?? '',
      country: json['location']['country'] ?? '',
      profileImageUrl: 'https://i.pravatar.cc/150?u=${json['login']['uuid']}',
      largeImageUrl: 'https://i.pravatar.cc/800?u=${json['login']['uuid']}',
    );
  }
}
