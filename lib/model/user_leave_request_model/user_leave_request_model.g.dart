// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_leave_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLeaveRequestModel _$UserLeaveRequestModelFromJson(
        Map<String, dynamic> json) =>
    UserLeaveRequestModel(
      id: json['id'] as int?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      start: json['start'] as String?,
      end: json['end'] as String?,
      reasone: json['reasone'] as String?,
      isApproved: json['is_approved'] as bool?,
    );

Map<String, dynamic> _$UserLeaveRequestModelToJson(
        UserLeaveRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'start': instance.start,
      'end': instance.end,
      'reasone': instance.reasone,
      'is_approved': instance.isApproved,
    };
