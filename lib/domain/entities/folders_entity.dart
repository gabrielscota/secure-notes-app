import 'package:equatable/equatable.dart';

import 'entities.dart';

class FoldersEntity extends Equatable {
  final List<FolderEntity> folders;

  const FoldersEntity({
    required this.folders,
  });

  @override
  List<Object> get props => [
        folders,
      ];
}
