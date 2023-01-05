import 'dart:convert';

class Prefix {
  Prefix({
    required this.symbol,
    required this.quantity,
  });

  final String symbol;
  final int quantity;

  factory Prefix.fromJson(String str) => Prefix.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Prefix.fromMap(Map<String, dynamic> json) => Prefix(
        symbol: json["symbol"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toMap() => {
        "symbol": symbol,
        "quantity": quantity,
      };
}

class Measurment {
  Measurment({
    required this.name,
  });

  final String name;

  factory Measurment.fromJson(String str) =>
      Measurment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Measurment.fromMap(Map<String, dynamic> json) => Measurment(
        name: json["symbol"],
      );

  Map<String, dynamic> toMap() => {
        "symbol": name,
      };
}

class Unit {
  Unit({
    required this.symbol,
    this.measurment,
    this.unit,
    this.prefix,
  });

  final String symbol;
  final Measurment? measurment;
  final Unit? unit;
  final Prefix? prefix;

  factory Unit.fromJson(String str) => Unit.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Unit.fromMap(Map<String, dynamic> json) => Unit(
        symbol: json["symbol"],
        measurment: Measurment.fromMap(json["measurment"]),
        unit: Unit.fromMap(json["unit"]),
        prefix: Prefix.fromMap(json["prefix"]),
      );

  Map<String, dynamic> toMap() => {
        "symbol": symbol,
        "measurment": measurment!.toMap(),
        "unit": unit!.toMap(),
        "prefix": prefix!.toMap(),
      };
}
