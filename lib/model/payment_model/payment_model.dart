class User {
  final int id;
  final String name;
  final String? profilePicture;
  final String? dateOfBirth;
  final String email;
  final String? gender;
  final String? guardianName;
  final int? guardianContactNumber;
  final int? number;
  final bool married;
  final int? alternateNumber;
  final bool isFormFilled;
  final String lastPayment;
  final bool isSuperuser;
  final String? address;
  final String? pincode;
  final String? post;
  final int? aadharNumber;
  final int? age;

  User({
    required this.id,
    required this.name,
    this.profilePicture,
    this.dateOfBirth,
    required this.email,
    this.gender,
    this.guardianName,
    this.guardianContactNumber,
    this.number,
    required this.married,
    this.alternateNumber,
    required this.isFormFilled,
    required this.lastPayment,
    required this.isSuperuser,
    this.address,
    this.pincode,
    this.post,
    this.aadharNumber,
    this.age,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['user']['name'],
      profilePicture: json['user']['profile_picture'],
      dateOfBirth: json['user']['date_of_birth'],
      email: json['user']['email'],
      gender: json['user']['gender'],
      guardianName: json['user']['guardian_name'],
      guardianContactNumber: json['user']['guardian_contact_number'],
      number: json['user']['number'],
      married: json['user']['married'],
      alternateNumber: json['user']['alternate_number'],
      isFormFilled: json['user']['is_form_filled'],
      lastPayment: json['user']['last_payment'],
      isSuperuser: json['user']['is_superuser'],
      address: json['user']['address'],
      pincode: json['user']['pincode'],
      post: json['user']['post'],
      aadharNumber: json['user']['aadhar_number'],
      age: json['user']['age'],
    );
  }
}

class Payment {
  final int id;
  final User user;
  final String paymentDate;
  final String amount;
  final String paymentId;

  Payment({
    required this.id,
    required this.user,
    required this.paymentDate,
    required this.amount,
    required this.paymentId,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'],
      user: User.fromJson(json),
      paymentDate: json['payment_date'],
      amount: json['amount'],
      paymentId: json['payment_id'],
    );
  }
}
