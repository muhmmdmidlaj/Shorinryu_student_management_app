import 'package:json_annotation/json_annotation.dart';
import 'package:shorinryu/model/users_get_model/users_get_model.dart';



part 'user_leave_request_model.g.dart';

@JsonSerializable()
class UserLeaveRequestModel {
	int? id;
	UsersGetModel? user;
	String? start;
	String? end;
	String? reasone;
	@JsonKey(name: 'is_approved') 
	bool? isApproved;

	UserLeaveRequestModel({
		this.id, 
		this.user, 
		this.start, 
		this.end, 
		this.reasone, 
		this.isApproved, 
	});

	factory UserLeaveRequestModel.fromJson(Map<String, dynamic> json) {
		return _$UserLeaveRequestModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$UserLeaveRequestModelToJson(this);
}
