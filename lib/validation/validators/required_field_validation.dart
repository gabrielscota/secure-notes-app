import 'package:equatable/equatable.dart';

import '../../presentation/protocols/protocols.dart';
import '../protocols/protocols.dart';

class RequiredFieldValidation extends Equatable implements FieldValidation {
  @override
  final String field;

  const RequiredFieldValidation({required this.field});

  @override
  ValidationError validate(final Map input) =>
      (input[field] as String).isNotEmpty == true ? ValidationError.noError : ValidationError.requiredField;

  @override
  List<Object> get props => [field];
}
