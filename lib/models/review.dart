import 'package:json_annotation/json_annotation.dart';
import 'package:tv_shows/models/user.dart';

part 'review.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Review {
  String? id;
  String comment;
  int rating;
  int showId;
  User? user;
  Review({
    required this.id,
    required this.comment,
    required this.rating,
    required this.showId,
    required this.user,
  });

  Review.submit(this.comment, this.rating, this.showId);

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
