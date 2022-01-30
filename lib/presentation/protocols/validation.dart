abstract class Validation {
  ValidationError validate({required final String field, required final Map input});
}

enum ValidationError { requiredField, invalidField, invalidCpf, noError }
