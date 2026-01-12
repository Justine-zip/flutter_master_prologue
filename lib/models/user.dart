class Users {
  String id;
  String? name;
  String username;

  Users({required this.id, required this.name, required this.username});

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['userid'],
      name: json['name'],
      username: json['username'],
    );
  }
}
