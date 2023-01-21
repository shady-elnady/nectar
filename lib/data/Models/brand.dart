// ignore_for_file: depend_on_referenced_packages, unused_import

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:collection/collection.dart';

@immutable
class Brand {
  final String? name;
  final String? image;

  const Brand({this.name, this.image});

  @override
  String toString() => 'Brand(name: $name, image: $image)';

  factory Brand.fromMap(Map<String, dynamic> data) => Brand(
        name: data['name'] as String?,
        image: data['image'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'image': image,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Brand].
  factory Brand.fromJson(String data) {
    return Brand.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Brand] to a JSON string.
  String toJson() => json.encode(toMap());

  Brand copyWith({
    String? name,
    String? image,
  }) {
    return Brand(
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }
}
