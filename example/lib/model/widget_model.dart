import 'package:json_annotation/json_annotation.dart';
import 'package:stack_board_example/model/offset_model.dart';
import 'package:stack_board_example/model/sized_model.dart';

part 'widget_model.g.dart';

@JsonSerializable()
class WidgetModel {
  WidgetModel({required this.offset, required this.size});

  factory WidgetModel.fromJson(Map<String, dynamic> json) =>
      _$WidgetModelFromJson(json);

  Map<String, dynamic> toJson() => _$WidgetModelToJson(this);

  OffsetModel offset;

  SizedModel size;
}
