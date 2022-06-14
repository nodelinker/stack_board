// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TempModel _$TempModelFromJson(Map<String, dynamic> json) => TempModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      children: (json['children'] as List<WidgetModel>?)
          ?.map((WidgetModel e) =>
              WidgetModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TempModelToJson(TempModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'children': instance.children,
    };
