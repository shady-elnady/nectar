import 'dart:convert';

import '../Entities/base_entity.dart';

abstract class BaseModel extends BaseEntity {
  const BaseModel({
    required super.url,
  });

  // factory BaseModel.fromMap(Map<String, dynamic> data) => BaseModel(
  //       url: data['url'] as String,
  //       slug: data['slug'] as String,
  //     );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BaseModel].
  // factory BaseModel.fromJson(String data) {
  // return BaseModel.fromMap(json.decode(data) as Map<String, dynamic>);
  // }

  /// `dart:convert`
  ///
  /// Converts [BaseModel] to a JSON string.
  @override
  String toJson() => json.encode(toMap());

  @override
  Map<String, dynamic> toMap() => {
        'url': url,
      };
}

// class MySuperClass {
//   final String s;
//   MySuperClass._internal(this.s);

//   factory MySuperClass(int a) {
//     return MySuperClass._internal(a.toString());
//   }
// }

// class MySubClass extends MySuperClass {
//   final int b;

//   MySubClass(int a, this.b) : super._internal(a.toString());
// }
