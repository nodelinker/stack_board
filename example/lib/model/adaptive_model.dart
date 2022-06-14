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
      required double angle,
      required this.text})
      : super(offset: offset, size: size, angle: angle);

  factory AdaptiveModel.fromJson(Map<String, dynamic> json) =>
      _$AdaptiveModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AdaptiveModelToJson(this);

  String text;
}
