import 'package:equatable/equatable.dart';

class Tool extends Equatable {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final String category;
  final bool isTrending;
  final bool isFavorite;
  final int usageCount;

  const Tool({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.category,
    this.isTrending = false,
    this.isFavorite = false,
    this.usageCount = 0,
  });

  Tool copyWith({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    String? category,
    bool? isTrending,
    bool? isFavorite,
    int? usageCount,
  }) {
    return Tool(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      isTrending: isTrending ?? this.isTrending,
      isFavorite: isFavorite ?? this.isFavorite,
      usageCount: usageCount ?? this.usageCount,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        imageUrl,
        category,
        isTrending,
        isFavorite,
        usageCount,
      ];
}
