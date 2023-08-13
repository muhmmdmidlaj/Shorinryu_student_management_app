// class User {
//   final int id;
//   final String name;
//   final String? profilePicture;
//   final String? dateOfBirth;
//   final String email;
//   final String? gender;
//   final String? guardianName;
//   final int? guardianContactNumber;
//   final int? number;
//   final bool married;
//   final int? alternateNumber;
//   final bool isFormFilled;
//   final String? lastPayment;
//   final bool isSuperuser;
//   final String? address;
//   final String? pincode;
//   final String? post;
//   final int? aadharNumber;

//   User({
//     required this.id,
//     required this.name,
//     this.profilePicture,
//     this.dateOfBirth,
//     required this.email,
//     this.gender,
//     this.guardianName,
//     this.guardianContactNumber,
//     this.number,
//     required this.married,
//     this.alternateNumber,
//     required this.isFormFilled,
//     this.lastPayment,
//     required this.isSuperuser,
//     this.address,
//     this.pincode,
//     this.post,
//     this.aadharNumber,
//   });

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json['id'],
//       name: json['name'] ?? '',
//       profilePicture: json['profile_picture'],
//       dateOfBirth: json['date_of_birth'],
//       email: json['email'],
//       gender: json['gender'],
//       guardianName: json['guardian_name'],
//       guardianContactNumber: json['guardian_contact_number'],
//       number: json['number'],
//       married: json['married'],
//       alternateNumber: json['alternate_number'],
//       isFormFilled: json['is_form_filled'],
//       lastPayment: json['last_payment'],
//       isSuperuser: json['is_superuser'],
//       address: json['address'],
//       pincode: json['pincode'],
//       post: json['post'],
//       aadharNumber: json['aadhar_number'],
//     );
//   }
// }