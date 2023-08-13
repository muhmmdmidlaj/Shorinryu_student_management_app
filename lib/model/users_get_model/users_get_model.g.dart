// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_get_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersGetModel _$UsersGetModelFromJson(Map<String, dynamic> json) =>
    UsersGetModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      profilePicture: json['profile_picture'],
      dateOfBirth: json['date_of_birth'],
      email: json['email'] as String?,
      gender: json['gender'],
      guardianName: json['guardian_name'],
      guardianContactNumber: json['guardian_contact_number'],
      number: json['number'],
      married: json['married'] as bool?,
      alternateNumber: json['alternate_number'],
      isFormFilled: json['is_form_filled'] as bool?,
      lastPayment: json['last_payment'],
      isSuperuser: json['is_superuser'] as bool?,
      address: json['address'],
      pincode: json['pincode'],
      post: json['post'],
      aadharNumber: json['aadhar_number'],
      age: json['age'] as int?,
    );

Map<String, dynamic> _$UsersGetModelToJson(UsersGetModel instance) =>
    <String, dynamic>{
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
