// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CarModel {
  final String? id;
  final String? name;
  final int? carPlatte;
  final String? image;
  CarModel({
    this.id,
    this.name,
    this.carPlatte,
    this.image,
  });

  CarModel copyWith({
    String? id,
    String? name,
    int? carPlatte,
    String? image,
  }) {
    return CarModel(
      id: id ?? this.id,
      name: name ?? this.name,
      carPlatte: carPlatte ?? this.carPlatte,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'carPlatte': carPlatte,
      'image': image,
    };
  }

  factory CarModel.fromMap(Map<String, dynamic> map) {
    return CarModel(
      id: map['id'] != null ? map['id'] as String : "-1",
      name: map['name'] != null ? map['name'] as String : "unknow name",
      carPlatte: map['carPlatte'] != null ? map['carPlatte'] as int : 0000000,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CarModel.fromJson(String source) => CarModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CarModel(id: $id, name: $name, carPlatte: $carPlatte, image: $image)';
  }

  @override
  bool operator ==(covariant CarModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.carPlatte == carPlatte &&
      other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      carPlatte.hashCode ^
      image.hashCode;
  }
}
