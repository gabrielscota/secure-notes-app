import 'package:get/get.dart';

import '../../../data/cache/cache.dart';
import '../../../ui/pages/pages.dart';
import '../../../viewmodels/viewmodels.dart';
import '../../mixins/mixins.dart';

class GetxHomePresenter extends GetxController with NavigationManager implements HomePresenter {
  final FetchSecureCacheStorage fetchSecure;

  GetxHomePresenter({
    required this.fetchSecure,
  });

  final RxList<NoteViewModel> _allNotes = RxList.empty();
  @override
  Stream<List<NoteViewModel>> get allNotesStream => _allNotes.stream;

  @override
  void addNote({required final NoteViewModel note}) {
    _allNotes.add(note);
  }

  @override
  void goToNotePage() {
    navigateToWithArgs = NavigationArguments(
      route: Routes.note,
      arguments: {
        'addNoteFunction': addNote,
      },
    );
  }
}
