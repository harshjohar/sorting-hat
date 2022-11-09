class UserModel {
  final String name;
  final String? house;
  final String? avatar;

  UserModel({required this.name, this.avatar, this.house});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'house': house,
      'avatar': avatar,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      house: map['house'] ?? '',
      avatar: map['avatar'] ?? '',
    );
  }
}
