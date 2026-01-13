class Users {
  String id;
  String username;

  Users({required this.id, required this.username});

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(id: json['userid'], username: json['username']);
  }
}
