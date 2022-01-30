import '../../presentation/protocols/protocols.dart';
import '../../validation/protocols/protocols.dart';

class ValidationComposite implements Validation {
  final List<FieldValidation> validations;

  ValidationComposite({required this.validations});

  @override
  ValidationError validate({required final String field, required final Map input}) {
    ValidationError error = ValidationError.noError;
    for (final validation in validations.where((final validation) => validation.field == field)) {
      error = validation.validate(input);
      if (error != ValidationError.noError) {
        return error;
      }
    }
    return error;
  }
}
