// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Show _$ShowFromJson(Map<String, dynamic> json) => Show(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      no_of_reviews: json['no_of_reviews'] as int?,
      average_rating: (json['average_rating'] as num?)?.toDouble(),
      image_url: json['image_url'] as String?,
    );

Map<String, dynamic> _$ShowToJson(Show instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'no_of_reviews': instance.no_of_reviews,
      'average_rating': instance.average_rating,
      'image_url': instance.image_url,
    };
