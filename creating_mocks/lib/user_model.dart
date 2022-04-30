class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String thumbnailUrl;

  const UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.thumbnailUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['name']['first'] as String,
      lastName: json['name']['last'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      thumbnailUrl: json['picture']['thumbnail'] as String,
    );
  }
}
