import 'package:equatable/equatable.dart';

class TagEntity extends Equatable {
  final String id;
  final String title;
  final String createdAt;
  final String updatedAt;

  const TagEntity({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object> get props => [id, title, createdAt, updatedAt];
}
