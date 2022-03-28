// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Show _$ShowFromJson(Map<String, dynamic> json) => Show(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      noOfReviews: json['no_of_reviews'] as int?,
      averageRating: (json['average_rating'] as num?)?.toDouble(),
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$ShowToJson(Show instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'no_of_reviews': instance.noOfReviews,
      'average_rating': instance.averageRating,
      'image_url': instance.imageUrl,
    };
