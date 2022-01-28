import 'package:equatable/equatable.dart';

class NoteViewModel extends Equatable {
  final String id;
  final String title;
  final String text;
  final bool isFavorite;

  const NoteViewModel({
    required this.id,
    required this.title,
    required this.text,
    required this.isFavorite,
  });

  @override
  List<Object> get props => [id, title, text, isFavorite];
}
