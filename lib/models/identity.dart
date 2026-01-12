class Identity {
  final String? user;
  final String? receiver;

  const Identity({this.user, this.receiver});

  Identity copyWith({String? user, String? receiver}) {
    return Identity(
      user: user ?? this.user,
      receiver: receiver ?? this.receiver,
    );
  }
}
