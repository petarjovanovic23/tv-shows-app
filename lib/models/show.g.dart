// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Show _$ShowFromJson(Map<String, dynamic> json) => Show(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      numOfReviews: json['numOfReviews'] as int,
      averageRating: (json['averageRating'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$ShowToJson(Show instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'numOfReviews': instance.numOfReviews,
      'averageRating': instance.averageRating,
      'imageUrl': instance.imageUrl,
    };
