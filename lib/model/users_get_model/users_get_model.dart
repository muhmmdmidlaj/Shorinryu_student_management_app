import 'package:json_annotation/json_annotation.dart';

part 'users_get_model.g.dart';

@JsonSerializable()
class UsersGetModel {
  int? id;
  int? age; 
  String? name;
  @JsonKey(name: 'profile_picture')
  dynamic profilePicture;
  @JsonKey(name: 'date_of_birth')
  dynamic dateOfBirth;
  String? email;
  dynamic gender;
  @JsonKey(name: 'guardian_name')
  dynamic guardianName;
  @JsonKey(name: 'guardian_contact_number')
  dynamic guardianContactNumber;
  dynamic number;
  bool? married;
  @JsonKey(name: 'alternate_number')
  dynamic alternateNumber;
  @JsonKey(name: 'is_form_filled')
  bool? isFormFilled;
  @JsonKey(name: 'last_payment')
  dynamic lastPayment;
  @JsonKey(name: 'is_superuser')
  bool? isSuperuser;
  dynamic address;
  dynamic pincode;
  dynamic post;
  @JsonKey(name: 'aadhar_number')
  dynamic aadharNumber;

  UsersGetModel({
    this.id,
    this.name,
    this.profilePicture,
    this.dateOfBirth,
    this.email,
    this.gender,
    this.guardianName,
    this.guardianContactNumber,
    this.number,
    this.married,
    this.alternateNumber,
    this.isFormFilled,
    this.lastPayment,
    this.isSuperuser,
    this.address,
    this.pincode,
    this.post,
    this.aadharNumber,
    this.age
  });

  factory UsersGetModel.fromJson(Map<String, dynamic> json) {
    return _$UsersGetModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UsersGetModelToJson(this);
}
