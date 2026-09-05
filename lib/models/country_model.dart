import 'dart:convert';

class CountryModel {
  final String? native;
  final String? capital;
  final String? emoji;
  final String? currency;
  final List<Language>? languages;
  final String? name;

  CountryModel({
    this.native,
    this.capital,
    this.emoji,
    this.currency,
    this.languages,
    this.name,
  });

  CountryModel copyWith({
    String? native,
    String? capital,
    String? emoji,
    String? currency,
    List<Language>? languages,
    String? name,
  }) => CountryModel(
    native: native ?? this.native,
    capital: capital ?? this.capital,
    emoji: emoji ?? this.emoji,
    currency: currency ?? this.currency,
    languages: languages ?? this.languages,
    name: name ?? this.name,
  );

  factory CountryModel.fromJson(String str) =>
      CountryModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CountryModel.fromMap(Map<String, dynamic> json) => CountryModel(
    native: json["native"],
    capital: json["capital"],
    emoji: json["emoji"],
    currency: json["currency"],
    languages: json["languages"] == null
        ? []
        : List<Language>.from(
            json["languages"]!.map((x) => Language.fromMap(x)),
          ),
    name: json["name"],
  );

  Map<String, dynamic> toMap() => {
    "native": native,
    "capital": capital,
    "emoji": emoji,
    "currency": currency,
    "languages": languages == null
        ? []
        : List<dynamic>.from(languages!.map((x) => x.toMap())),
    "name": name,
  };
}

class Language {
  final String? name;

  Language({this.name});

  Language copyWith({String? name}) => Language(name: name ?? this.name);

  factory Language.fromJson(String str) => Language.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Language.fromMap(Map<String, dynamic> json) =>
      Language(name: json["name"]);

  Map<String, dynamic> toMap() => {"name": name};
}
