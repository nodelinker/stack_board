// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adaptive_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdaptiveModel _$AdaptiveModelFromJson(Map<String, dynamic> json) =>
    AdaptiveModel(
      offset: OffsetModel.fromJson(json['offset'] as Map<String, dynamic>),
      size: SizedModel.fromJson(json['size'] as Map<String, dynamic>),
      text: json['text'] as String,
    );

Map<String, dynamic> _$AdaptiveModelToJson(AdaptiveModel instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'size': instance.size,
      'text': instance.text,
    };
