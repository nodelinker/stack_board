import 'package:json_annotation/json_annotation.dart';
import 'package:stack_board_example/model/offset_model.dart';
import 'package:stack_board_example/model/sized_model.dart';
import 'package:stack_board_example/model/widget_model.dart';

part 'adaptive_model.g.dart';

@JsonSerializable()
class AdaptiveModel extends WidgetModel {
  AdaptiveModel(
      {required OffsetModel offset,
      required SizedModel size,
      required this.text})
      : super(offset: offset, size: size);

  factory AdaptiveModel.fromJson(Map<String, dynamic> json) =>
      _$AdaptiveModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdaptiveModelToJson(this);

  String text;
}
