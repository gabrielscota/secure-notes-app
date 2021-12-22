import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/pages/pages.dart';
import '../../factories.dart';

NotePresenter makeGetxNotePresenter() => GetxNotePresenter(
      encryptData: makeEncryptData(),
      decryptData: makeDecryptData(),
      fetchSecretKey: makeLocalFetchSecretKey(),
    );
