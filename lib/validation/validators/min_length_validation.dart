import 'package:equatable/equatable.dart';

import '../../presentation/protocols/protocols.dart';
import '../protocols/protocols.dart';

class MinLengthValidation extends Equatable implements FieldValidation {
  @override
  final String field;
  final int size;

  const MinLengthValidation({required this.field, required this.size});

  @override
  ValidationError validate(Map input) => input[field] != null && (input[field] as String).length >= size == true
      ? ValidationError.noError
      : ValidationError.invalidField;

  @override
  List<Object> get props => [field, size];
}
