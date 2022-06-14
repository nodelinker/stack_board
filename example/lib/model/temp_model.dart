import 'package:json_annotation/json_annotation.dart';
import 'package:stack_board_example/model/widget_model.dart';

part 'temp_model.g.dart';

@JsonSerializable()
class TempModel {
  TempModel({
    required this.id,
    required this.name,
    this.description,
    this.children,
  });

  factory TempModel.fromJson(Map<String, dynamic> json) =>
      _$TempModelFromJson(json);

  Map<String, dynamic> toJson() => _$TempModelToJson(this);

  String id;
  String name;
  String? description;
  List<WidgetModel>? children;
}
