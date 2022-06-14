// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_widget_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomWidgetModel _$CustomWidgetModelFromJson(Map<String, dynamic> json) =>
    CustomWidgetModel(
      color: json['color'] as String,
      offset: OffsetModel.fromJson(json['offset'] as Map<String, dynamic>),
      size: SizedModel.fromJson(json['size'] as Map<String, dynamic>),
      angle: (json['angle'] as num).toDouble(),
    );

Map<String, dynamic> _$CustomWidgetModelToJson(CustomWidgetModel instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'size': instance.size,
      'angle': instance.angle,
      'color': instance.color,
    };
