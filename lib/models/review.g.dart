// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      id: json['id'] as String?,
      comment: json['comment'] as String,
      rating: json['rating'] as int,
      show_id: json['show_id'] as int,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'id': instance.id,
      'comment': instance.comment,
      'rating': instance.rating,
      'show_id': instance.show_id,
      'user': instance.user,
    };
