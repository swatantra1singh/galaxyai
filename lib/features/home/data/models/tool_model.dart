import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/tool.dart';

part 'tool_model.g.dart';

@JsonSerializable()
class ToolModel {
  final String id;
  final String name;
  final String description;
  @JsonKey(name: 'image_url')
  final String imageUrl;
  final String category;
  @JsonKey(name: 'is_trending')
  final bool isTrending;
  @JsonKey(name: 'is_favorite')
  final bool isFavorite;
  @JsonKey(name: 'usage_count')
  final int usageCount;

  const ToolModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.category,
    this.isTrending = false,
    this.isFavorite = false,
    this.usageCount = 0,
  });

  factory ToolModel.fromJson(Map<String, dynamic> json) =>
      _$ToolModelFromJson(json);

  Map<String, dynamic> toJson() => _$ToolModelToJson(this);

  Tool toEntity() {
    return Tool(
      id: id,
      name: name,
      description: description,
      imageUrl: imageUrl,
      category: category,
      isTrending: isTrending,
      isFavorite: isFavorite,
      usageCount: usageCount,
    );
  }

  factory ToolModel.fromEntity(Tool tool) {
    return ToolModel(
      id: tool.id,
      name: tool.name,
      description: tool.description,
      imageUrl: tool.imageUrl,
      category: tool.category,
      isTrending: tool.isTrending,
      isFavorite: tool.isFavorite,
      usageCount: tool.usageCount,
    );
  }
}
