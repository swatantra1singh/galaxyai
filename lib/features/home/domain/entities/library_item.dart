import 'package:equatable/equatable.dart';

class LibraryItem extends Equatable {
  final String id;
  final String name;
  final String type; // image, video, audio
  final String gradientStart;
  final String gradientEnd;
  final String icon;

  const LibraryItem({
    required this.id,
    required this.name,
    required this.type,
    required this.gradientStart,
    required this.gradientEnd,
    required this.icon,
  });

  @override
  List<Object?> get props => [id, name, type, gradientStart, gradientEnd, icon];
}
