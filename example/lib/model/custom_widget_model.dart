import 'package:json_annotation/json_annotation.dart';
import 'package:stack_board_example/model/sized_model.dart';

import 'package:stack_board_example/model/offset_model.dart';

import 'widget_model.dart';

part 'custom_widget_model.g.dart';

@JsonSerializable()
class CustomWidgetModel extends WidgetModel {
  CustomWidgetModel(
      {required this.color,
      required OffsetModel offset,
      required SizedModel size,
      required double angle})
      : super(offset: offset, size: size, angle: angle);

  factory CustomWidgetModel.fromJson(Map<String, dynamic> json) =>
      _$CustomWidgetModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CustomWidgetModelToJson(this);

  final String color;
}
