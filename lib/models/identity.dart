class Identity {
  final String? user;
  final String? receiver;
  final String? userId;
  final String? receiverId;

  const Identity({this.user, this.receiver, this.userId, this.receiverId});

  Identity copyWith({
    String? user,
    String? receiver,
    String? userId,
    String? receiverId,
  }) {
    return Identity(
      user: user ?? this.user,
      receiver: receiver ?? this.receiver,
      userId: userId ?? this.userId,
      receiverId: receiverId ?? this.receiverId,
    );
  }
}
