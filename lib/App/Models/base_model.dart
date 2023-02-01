abstract class BaseModel {
  BaseModel();

  BaseModel.fromMap(Map<String, dynamic> data);

  Map<String, dynamic> toMap();

  /// `dart:convert`
  /// Parses the string and returns the resulting Json object as [BaseModel].
  BaseModel.fromJson(String data);

  /// `dart:convert`
  /// Converts [BaseModel] to a JSON string.
  String toJson();

  BaseModel copyWith();
}
