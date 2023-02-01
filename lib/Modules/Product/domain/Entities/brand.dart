import 'dart:convert';

import 'package:equatable/equatable.dart';

class Brand extends Equatable {
  final String name;
  final String? image;

  const Brand({
    required this.name,
    this.image,
  });

  @override
  String toString() => 'Brand(name: $name, image: $image)';

  /// `dart:convert`
  ///
  /// Converts [BrandModel] to a JSON string.
  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'name': name,
        'image': image,
      };

  Brand copyWith({
    required String name,
    String? image,
  }) {
    return Brand(
      name: this.name,
      image: image ?? this.image,
    );
  }

  @override
  List<Object?> get props => [
        name,
        image,
      ];
}
