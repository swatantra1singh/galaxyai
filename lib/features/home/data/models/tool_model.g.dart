// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tool_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToolModel _$ToolModelFromJson(Map<String, dynamic> json) => ToolModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['image_url'] as String,
      category: json['category'] as String,
      isTrending: json['is_trending'] as bool? ?? false,
      isFavorite: json['is_favorite'] as bool? ?? false,
      usageCount: json['usage_count'] as int? ?? 0,
    );

Map<String, dynamic> _$ToolModelToJson(ToolModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'category': instance.category,
      'is_trending': instance.isTrending,
      'is_favorite': instance.isFavorite,
      'usage_count': instance.usageCount,
    };
