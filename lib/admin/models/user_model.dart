import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String userId;
  String name;
  String adress;
  bool isBlocked;



  UserModel({
    required this.userId,
    required this.name,
    required this.adress,
    required this.isBlocked,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  get announcments => null;

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}


