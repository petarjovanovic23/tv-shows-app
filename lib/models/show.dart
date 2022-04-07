import 'package:json_annotation/json_annotation.dart';

part 'show.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Show {
  String? id;
  String? title;
  String? description;
  int? noOfReviews;
  double? averageRating;
  String? imageUrl;

  Show({
    required this.id,
    required this.title,
    required this.description,
    required this.noOfReviews,
    required this.averageRating,
    required this.imageUrl,
  });

  factory Show.fromJson(Map<String, dynamic> json) => _$ShowFromJson(json);

  Map<String, dynamic> toJson() => _$ShowToJson(this);
}
