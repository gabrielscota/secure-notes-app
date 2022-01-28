import 'package:equatable/equatable.dart';

import 'viewmodels.dart';

class FolderViewModel extends Equatable {
  final String id;
  final String title;
  final String description;
  final List<NoteViewModel> notes;

  const FolderViewModel({
    required this.id,
    required this.title,
    required this.description,
    required this.notes,
  });

  @override
  List<Object> get props => [id, title, description, notes];
}
