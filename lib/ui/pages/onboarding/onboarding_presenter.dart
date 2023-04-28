import '../../../presentation/mixins/mixins.dart';
import '../../helpers/helpers.dart';

abstract class OnboardingPresenter {
  Stream<NavigationArguments> get navigateToWithArgsStream;
  Stream<bool> get isFormValidStream;

  Stream<UIError> get nameErrorStream;
  void validateName(String value);

  Future<void> saveUser();
}
