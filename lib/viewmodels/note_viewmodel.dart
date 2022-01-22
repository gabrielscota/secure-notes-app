import 'package:equatable/equatable.dart';

class NoteViewModel extends Equatable {
  final String id;
  final String title;
  final String text;

  const NoteViewModel({
    required this.id,
    required this.title,
    required this.text,
  });

  @override
  List<Object> get props => [id, title, text];
}
