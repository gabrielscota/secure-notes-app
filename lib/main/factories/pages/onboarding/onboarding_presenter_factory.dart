import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/pages/pages.dart';
import '../../factories.dart';

OnboardingPresenter makeGetxOnboardingPresenter() => GetxOnboardingPresenter(
      saveCurrentUserUseCase: makeLocalSaveCurrentUser(),
      validation: makeOnboardingValidation(),
    );
