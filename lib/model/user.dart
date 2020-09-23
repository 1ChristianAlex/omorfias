enum AccessLevel { admin, serviceProvider, serviceConsumer }

class User {
  final int id;
  final String name;
  final String lastName;
  final String userName;
  final AccessLevel accessLevel;

  User({this.userName, this.accessLevel, this.id, this.lastName, this.name});

  copyWith(User user) {
    return User(
      id: user.id ?? this.id,
      accessLevel: user.accessLevel ?? this.accessLevel,
      lastName: user.lastName ?? this.lastName,
      name: user.name ?? this.name,
      userName: user.userName ?? this.userName,
    );
  }

  factory User.initialUser() {
    return User(
      id: 0,
      accessLevel: AccessLevel.serviceConsumer,
      lastName: '',
      name: '',
      userName: '',
    );
  }

  factory User.fromJson(dynamic json) {
    return User(
      id: json['id'],
      name: json['name'],
      lastName: json['lastName'],
      userName: json['userName'],
      accessLevel: json['accessLevel'],
    );
  }
}
