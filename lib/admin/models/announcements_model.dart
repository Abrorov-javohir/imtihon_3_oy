import 'package:json_annotation/json_annotation.dart';

part 'announcements_model.g.dart';

@JsonSerializable()
class AnnouncementsModel {
  String title;
  double price;
  bool isFavorite;
  bool isPayed;

  AnnouncementsModel({
    required this.title,
    required this.price,
    required this.isPayed,
    required this.isFavorite,
  });

  factory AnnouncementsModel.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnnouncementsModelToJson(this);
}
