// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widget_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WidgetModel _$WidgetModelFromJson(Map<String, dynamic> json) => WidgetModel(
      offset: OffsetModel.fromJson(json['offset'] as Map<String, dynamic>),
      size: SizedModel.fromJson(json['size'] as Map<String, dynamic>),
      angle: (json['angle'] as num).toDouble(),
    );

Map<String, dynamic> _$WidgetModelToJson(WidgetModel instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'size': instance.size,
      'angle': instance.angle,
    };
