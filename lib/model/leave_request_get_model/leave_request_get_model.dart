// class UserReservation {
//   final int id;
//   final Map<String, dynamic> user;
//   final String start;
//   final String end;
//   final String reason;
//   final String name;
//   final dynamic prifile_photo;
//   final bool isApproved;

//   UserReservation(
//       {required this.id,
//       required this.user,
//       required this.start,
//       required this.end,
//       required this.reason,
//       required this.isApproved,
//       required this.name,
//       required this.prifile_photo});

//   factory UserReservation.fromJson(Map<String, dynamic> json) {
//     return UserReservation(
//         id: json['id'],
//         user: json['user'],
//         start: json['start'],
//         end: json['end'],
//         reason: json['reasone'],
//         isApproved: json['is_approved'],
//         prifile_photo: json['user']['profile_picture'],
//         name: json['user']['name']);
//   }
// }
