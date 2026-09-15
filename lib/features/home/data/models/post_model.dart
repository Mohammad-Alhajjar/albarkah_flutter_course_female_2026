// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:clean_arch_example/features/home/domain/entities/post_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class PostModel extends PostEntity {

  // @JsonKey(name: "id")
  // @HiveField(0)
  // final int? id;


  // @JsonKey(name: "title")
  // @HiveField(1)
  // final String? title;


  // @JsonKey(name: "body")
  // @HiveField(2)
  // final String? body;

  // PostModel({this.id, this.title, this.body});

  PostModel({super.id, super.title, super.body});

  PostModel copyWith({int? id, String? title, String? body}) {
    return PostModel(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() => _$PostModelToJson(this);

  factory PostModel.fromMap(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  @override
  String toString() => 'PostModel(id: $id, title: $title, body: $body)';

  @override
  bool operator ==(covariant PostModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.title == title && other.body == body;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ body.hashCode;
}
