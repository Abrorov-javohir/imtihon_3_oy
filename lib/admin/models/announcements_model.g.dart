// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcements_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnouncementsModel _$AnnouncementsModelFromJson(Map<String, dynamic> json) =>
    AnnouncementsModel(
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      isPayed: json['isPayed'] as bool,
      isFavorite: json['isFavorite'] as bool,
    );

Map<String, dynamic> _$AnnouncementsModelToJson(AnnouncementsModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'price': instance.price,
      'isFavorite': instance.isFavorite,
      'isPayed': instance.isPayed,
    };
