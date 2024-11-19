class User {
  final int? id; // Nullable if 'id' might be missing
  final String? name; // Nullable if 'name' might be null
  final String? email;
  final String? roles;
  final String? token;

  User({
    this.id,
    this.name,
    this.email,
    this.roles,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      roles: json['roles'] as String?,
      token: json['token'] as String?,
    );
  }
}
