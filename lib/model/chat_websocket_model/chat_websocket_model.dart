class MessageWeb {
  int id;
  String text;
  String type;
  Sender sender;
  Receiver receiver;
  DateTime createdAt;

  MessageWeb({
    required this.id,
    required this.text,
    required this.type,
    required this.sender,
    required this.receiver,
    required this.createdAt,
  });

  factory MessageWeb.fromJson(Map<String, dynamic> json) {
    return MessageWeb(
      id: json['message']['id'],
      text: json['message']['text'],
      type: json['message']['type'],
      sender: Sender.fromJson(json['message']['sender']),
      receiver: Receiver.fromJson(json['message']['receiver']),
      createdAt: DateTime.parse(json['message']['created_at']),
    );
  }
}

class Sender {
  int id;
  String name;
  String? profilePicture;
  String? dateOfBirth;
  String email;
  // Add other fields here

  Sender({
    required this.id,
    required this.name,
    this.profilePicture,
    this.dateOfBirth,
    required this.email,
    // Add other fields here
  });

  factory Sender.fromJson(Map<String, dynamic> json) {
    return Sender(
      id: json['id'],
      name: json['name'],
      profilePicture: json['profile_picture'],
      dateOfBirth: json['date_of_birth'],
      email: json['email'],
      // Map other fields here
    );
  }
}

class Receiver {
  int id;
  String name;
  String? profilePicture;
  String? dateOfBirth;
  String email;
  // Add other fields here

  Receiver({
    required this.id,
    required this.name,
    this.profilePicture,
    this.dateOfBirth,
    required this.email,
    // Add other fields here
  });

  factory Receiver.fromJson(Map<String, dynamic> json) {
    return Receiver(
      id: json['id'],
      name: json['name'],
      profilePicture: json['profile_picture'],
      dateOfBirth: json['date_of_birth'],
      email: json['email'],
      // Map other fields here
    );
  }
}
