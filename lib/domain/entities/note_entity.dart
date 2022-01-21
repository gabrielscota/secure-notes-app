import 'package:equatable/equatable.dart';

import 'entities.dart';

class NoteEntity extends Equatable {
  final String id;
  final String title;
  final String text;
  final bool isFavorite;
  final List<TagEntity> tags;
  final String createdAt;
  final String updatedAt;

  const NoteEntity({
    required this.id,
    required this.title,
    required this.text,
    required this.isFavorite,
    required this.tags,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object> get props => [
        id,
        title,
        text,
        isFavorite,
        tags,
        createdAt,
        updatedAt,
      ];
}
