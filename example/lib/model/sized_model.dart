import 'package:json_annotation/json_annotation.dart';

part 'sized_model.g.dart';

@JsonSerializable()
class SizedModel {
  SizedModel({required this.width, required this.height});

  factory SizedModel.fromJson(Map<String, dynamic> json) =>
      _$SizedModelFromJson(json);
  Map<String, dynamic> toJson() => _$SizedModelToJson(this);

  double width;
  double height;
}
