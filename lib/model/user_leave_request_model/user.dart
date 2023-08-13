import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
	int? id;
	String? name;
	@JsonKey(name: 'profile_picture') 
	String? profilePicture;
	@JsonKey(name: 'date_of_birth') 
	String? dateOfBirth;
	String? email;
	String? gender;
	@JsonKey(name: 'guardian_name') 
	String? guardianName;
	@JsonKey(name: 'guardian_contact_number') 
	int? guardianContactNumber;
	int? number;
	bool? married;
	@JsonKey(name: 'alternate_number') 
	int? alternateNumber;
	@JsonKey(name: 'is_form_filled') 
	bool? isFormFilled;
	@JsonKey(name: 'last_payment') 
	dynamic lastPayment;
	@JsonKey(name: 'is_superuser') 
	bool? isSuperuser;
	String? address;
	String? pincode;
	String? post;
	@JsonKey(name: 'aadhar_number') 
	int? aadharNumber;
	dynamic age;

	User({
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
		this.age, 
	});

	factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

	Map<String, dynamic> toJson() => _$UserToJson(this);
}
