// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      name: json['name'] as String?,
      profilePicture: json['profile_picture'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      guardianName: json['guardian_name'] as String?,
      guardianContactNumber: json['guardian_contact_number'] as int?,
      number: json['number'] as int?,
      married: json['married'] as bool?,
      alternateNumber: json['alternate_number'] as int?,
      isFormFilled: json['is_form_filled'] as bool?,
      lastPayment: json['last_payment'],
      isSuperuser: json['is_superuser'] as bool?,
      address: json['address'] as String?,
      pincode: json['pincode'] as String?,
      post: json['post'] as String?,
      aadharNumber: json['aadhar_number'] as int?,
      age: json['age'],
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profile_picture': instance.profilePicture,
      'date_of_birth': instance.dateOfBirth,
      'email': instance.email,
      'gender': instance.gender,
      'guardian_name': instance.guardianName,
      'guardian_contact_number': instance.guardianContactNumber,
      'number': instance.number,
      'married': instance.married,
      'alternate_number': instance.alternateNumber,
      'is_form_filled': instance.isFormFilled,
      'last_payment': instance.lastPayment,
      'is_superuser': instance.isSuperuser,
      'address': instance.address,
      'pincode': instance.pincode,
      'post': instance.post,
      'aadhar_number': instance.aadharNumber,
      'age': instance.age,
    };
