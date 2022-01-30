import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/usecases.dart';
import '../../../ui/helpers/errors/errors.dart';
import '../../../ui/pages/pages.dart';
import '../../mixins/mixins.dart';
import '../../protocols/protocols.dart';

class GetxOnboardingPresenter extends GetxController
    with LoadingManager, FormManager, NavigationManager, UIErrorManager
    implements OnboardingPresenter {
  final SaveCurrentUserUseCase saveCurrentUserUseCase;
  final Validation validation;

  GetxOnboardingPresenter({
    required this.saveCurrentUserUseCase,
    required this.validation,
  });

  String _name = '';
  final Rx<UIError> _nameError = Rx<UIError>(UIError.noError);
  @override
  Stream<UIError> get nameErrorStream => _nameError.stream;
  @override
  void validateName(final String value) {
    _name = value;
    _nameError.value = _validateField('name');
    _validateForm();
  }

  UIError _validateField(final String field) {
    final formData = {
      'name': _name,
    };
    final error = validation.validate(field: field, input: formData);
    switch (error) {
      case ValidationError.invalidField:
        return UIError.invalidField;
      case ValidationError.requiredField:
        return UIError.requiredField;
      case ValidationError.noError:
        return UIError.noError;
      default:
        return UIError.noError;
    }
  }

  void _validateForm() {
    isFormValid = _nameError.value == UIError.noError && _name != '';
  }

  @override
  Future<void> saveUser() async {
    try {
      isLoading = true;
      const Uuid uuid = Uuid();
      await saveCurrentUserUseCase.call(
        user: UserEntity(
          id: uuid.v4(),
          name: _name,
          email: '',
        ),
      );
      isLoading = false;
      navigateToWithArgs = const NavigationArguments(route: Routes.home, clearStack: true);
    } on DomainError catch (error) {
      isLoading = false;
      snackbarError = '${error.message} [${error.code.name}]';
    }
  }
}
