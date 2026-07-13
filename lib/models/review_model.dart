import 'dart:convert';

class ReviewModel {
  final int? id;
  final String? username;
  final int? rating;
  final String? reviewBody;

  ReviewModel({this.id, this.username, this.rating, this.reviewBody});

  ReviewModel copyWith({
    int? id,
    String? username,
    int? rating,
    String? reviewBody,
  }) => ReviewModel(
    id: id ?? this.id,
    username: username ?? this.username,
    rating: rating ?? this.rating,
    reviewBody: reviewBody ?? this.reviewBody,
  );

  factory ReviewModel.fromJson(String str) =>
      ReviewModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReviewModel.fromMap(Map<String, dynamic> json) => ReviewModel(
    id: json["id"],
    username: json["username"],
    rating: json["rating"],
    reviewBody: json["review_body"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "username": username,
    "rating": rating,
    "review_body": reviewBody,
  };
}
