import 'package:json_annotation/json_annotation.dart';

part 'offset_model.g.dart';

@JsonSerializable()
class OffsetModel {
  OffsetModel({required this.x, required this.y});

  factory OffsetModel.fromJson(Map<String, dynamic> json) =>
      _$OffsetModelFromJson(json);
  Map<String, dynamic> toJson() => _$OffsetModelToJson(this);

  final double x;
  final double y;
}
