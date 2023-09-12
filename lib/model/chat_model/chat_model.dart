class MessageChat {
  final int id;
  final String text;
  final String type;
  final String createdAt;
  final dynamic media;
  final int sender;
  final int receiver;

  MessageChat({
    required this.id,
    required this.text,
    required this.type,
    required this.createdAt,
    required this.media,
    required this.sender,
    required this.receiver,
  });

  factory MessageChat.fromJson(Map<String, dynamic> json) {
    return MessageChat(
      id: json['id'] as int,
      text: json['text'] as String,
      type: json['type'] as String,
      createdAt: json['created_at'] as String,
      media: json['media'],
      sender: json['sender'] as int,
      receiver: json['receiver'] as int,
    );
  }
}
