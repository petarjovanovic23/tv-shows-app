import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class User {
  User.empty()
      : id = null,
        email = null,
        imageUrl = null;
  User(this.id, this.email, this.imageUrl);

  bool isEmpty() {
    if (id == null && email == null && imageUrl == null) {
      return true;
    }

    return false;
  }

  @HiveField(0)
  String? id;

  @HiveField(1)
  String? email;

  @HiveField(2)
  String? imageUrl;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
