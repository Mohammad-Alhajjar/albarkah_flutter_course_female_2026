// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProfileModel {
  final int? id;
  final String? username;
  final String? image;
  ProfileModel({
    this.id,
    this.username,
    this.image,
  });

  ProfileModel copyWith({
    int? id,
    String? username,
    String? image,
  }) {
    return ProfileModel(
      id: id ?? this.id,
      username: username ?? this.username,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'image': image,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'] != null ? map['id'] as int : null,
      username: map['username'] != null ? map['username'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromJson(String source) => ProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProfileModel(id: $id, username: $username, image: $image)';

  @override
  bool operator ==(covariant ProfileModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.username == username &&
      other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ username.hashCode ^ image.hashCode;
}
