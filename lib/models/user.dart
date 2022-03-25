import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User.empty()
      : id = null,
        email = null,
        image_url = null;
  User(this.id, this.email, this.image_url);

  bool isEmpty() {
    if (id == null && email == null && image_url == null) {
      return true;
    }

    return false;
  }

  String? id, email, image_url;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
