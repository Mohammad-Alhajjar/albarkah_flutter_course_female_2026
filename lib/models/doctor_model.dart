import 'dart:convert';

import 'review_model.dart';

class DoctorModel {
  final int? id;
  final String? name;
  final String? specialization;
  final String? image;
  final String? location;
  final int? patientsCount;
  final int? experienceRate;
  final int? rating;
  final String? about;
  final String? workingTime;
  final List<ReviewModel>? reviews;

  DoctorModel({
    this.id,
    this.name,
    this.specialization,
    this.image,
    this.location,
    this.patientsCount,
    this.experienceRate,
    this.rating,
    this.about,
    this.workingTime,
    this.reviews,
  });

  DoctorModel copyWith({
    int? id,
    String? name,
    String? specialization,
    String? image,
    String? location,
    int? patientsCount,
    int? experienceRate,
    int? rating,
    String? about,
    String? workingTime,
    List<ReviewModel>? reviews,
  }) => DoctorModel(
    id: id ?? this.id,
    name: name ?? this.name,
    specialization: specialization ?? this.specialization,
    image: image ?? this.image,
    location: location ?? this.location,
    patientsCount: patientsCount ?? this.patientsCount,
    experienceRate: experienceRate ?? this.experienceRate,
    rating: rating ?? this.rating,
    about: about ?? this.about,
    workingTime: workingTime ?? this.workingTime,
    reviews: reviews ?? this.reviews,
  );

  factory DoctorModel.fromJson(String str) =>
      DoctorModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DoctorModel.fromMap(Map<String, dynamic> json) => DoctorModel(
    id: json["id"],
    name: json["name"],
    specialization: json["specialization"],
    image: json["image"],
    location: json["location"],
    patientsCount: json["patients_count"],
    experienceRate: json["experience_rate"],
    rating: json["rating"],
    about: json["about"],
    workingTime: json["working_time"],
    reviews: json["reviews"] == null
        ? []
        : List<ReviewModel>.from(
            json["reviews"]!.map((x) => ReviewModel.fromMap(x)),
          ),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "specialization": specialization,
    "image": image,
    "location": location,
    "patients_count": patientsCount,
    "experience_rate": experienceRate,
    "rating": rating,
    "about": about,
    "working_time": workingTime,
    "reviews": reviews == null
        ? []
        : List<dynamic>.from(reviews!.map((x) => x.toMap())),
  };
}
