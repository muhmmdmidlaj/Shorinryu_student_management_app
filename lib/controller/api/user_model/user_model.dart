

class UserModel {
  int? id;
  var name;
  var address;
  var post;
  var pin;
  var proof;
  var phone;
  var altranateNom;
  var email;
  var dob;
  var age;
  var parantsname;
  var parantsContact;
  var gender;
  var marriegestatus;

  UserModel({
    required this.id,
    required this.name,
    required this.address,
    required this.post,
    required this.pin,
    required this.proof,
    required this.phone,
    required this.altranateNom,
    required this.email,
    required this.dob,
    required this.age,
    required this.parantsname,
    required this.parantsContact,
    required this.gender,
    required this.marriegestatus,
  });
  UserModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['user']['id'];
  }
}
