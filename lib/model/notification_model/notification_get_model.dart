class Message {
  int id;
  String contentMessage;
  bool isSeen;
  int user;
  int content;

  Message({
    required this.id,
    required this.contentMessage,
    required this.isSeen,
    required this.user,
    required this.content,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'] as int,
      contentMessage: json['content_message'] as String,
      isSeen: json['is_seen'] as bool,
      user: json['user'] as int,
      content: json['content'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['content_message'] = contentMessage;
    data['is_seen'] = isSeen;
    data['user'] = user;
    data['content'] = content;
    return data;
  }
}
