import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/pages/pages.dart';
import '../../usecases/usecases.dart';

HomePresenter makeGetxHomePresenter() => GetxHomePresenter(
      fetchFoldersUseCase: makeLocalFetchFolders(),
    );
