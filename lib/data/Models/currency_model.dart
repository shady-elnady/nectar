import 'dart:convert';

class Currency {
  Currency({
    required this.name,
  });

  final String name;

  factory Currency.fromJson(String str) => Currency.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Currency.fromMap(Map<String, dynamic> json) => Currency(
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
      };
}
