class Chat {
  final int id;
  final String sender;
  final String receiver;
  final String senderId;
  final String receiverId;
  final String message;

  Chat({
    required this.id,
    required this.sender,
    required this.receiver,
    required this.senderId,
    required this.receiverId,
    required this.message,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      id: json['id'],
      sender: json['sender'],
      receiver: json['receiver'],
      senderId: json['sender_id'],
      receiverId: json['receiver_id'],
      message: json['message'],
    );
  }
}
