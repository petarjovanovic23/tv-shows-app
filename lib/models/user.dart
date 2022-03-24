import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

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

  String? id, email, imageUrl;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
