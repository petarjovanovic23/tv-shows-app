// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Show _$ShowFromJson(Map<String, dynamic> json) => Show(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      noOfReviews: json['noOfReviews'] as int?,
      averageRating: (json['averageRating'] as num?)?.toDouble(),
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$ShowToJson(Show instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'noOfReviews': instance.noOfReviews,
      'averageRating': instance.averageRating,
      'imageUrl': instance.imageUrl,
    };
