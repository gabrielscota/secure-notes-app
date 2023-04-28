import 'package:equatable/equatable.dart';

import '../../presentation/protocols/protocols.dart';
import '../protocols/protocols.dart';

class EmailValidation extends Equatable implements FieldValidation {
  @override
  final String field;

  const EmailValidation({required this.field});

  @override
  ValidationError validate(Map input) {
    final regex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    final isValid = (input[field] as String).isNotEmpty != true || regex.hasMatch(input[field].toString());
    return isValid ? ValidationError.noError : ValidationError.invalidField;
  }

  @override
  List<Object> get props => [field];
}
