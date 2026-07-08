// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TestModel {
  final int? id;
  final String? data;
  TestModel({this.id, this.data});

  TestModel copyWith({int? id, String? data}) {
    return TestModel(id: id ?? this.id, data: data ?? this.data);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'data': data};
  }

  factory TestModel.fromMap(Map<String, dynamic> map) {
    return TestModel(
      id: map['id'] != null ? map['id'] as int : null,
      data: map['data'] != null ? map['data'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TestModel.fromJson(String source) =>
      TestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TestModel(id: $id, data: $data)';

  @override
  bool operator ==(covariant TestModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.data == data;
  }

  @override
  int get hashCode => id.hashCode ^ data.hashCode;
}
