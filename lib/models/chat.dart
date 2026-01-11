class Chat {
  final int id;
  final String sender;
  final String receiver;
  final String message;

  Chat({
    required this.id,
    required this.sender,
    required this.receiver,
    required this.message,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      id: json['id'],
      sender: json['sender'],
      receiver: json['receiver'],
      message: json['message'],
    );
  }
}
