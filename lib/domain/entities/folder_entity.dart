import 'package:equatable/equatable.dart';

import 'entities.dart';

class FolderEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final List<NoteEntity> notes;
  final bool isSafe;
  final String createdAt;
  final String updatedAt;

  const FolderEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.notes,
    required this.isSafe,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object> get props => [
        id,
        title,
        description,
        notes,
        isSafe,
        createdAt,
        updatedAt,
      ];
}
