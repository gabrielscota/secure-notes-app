// ignore_for_file: constant_identifier_names

enum ErrorCode {
  DOM01,
  DAT01,
  INF01,
  PRE01,
  RMO01,
  RMO02,
  LMO01,
  LMO02,
  SST01,
  SST02,
  SST03,
  ENC01,
  ENC02,
  ENC03,
  UNEXP,
}

class DomainError implements Exception {
  final ErrorCode code;
  final String message;
  final Map<String, dynamic> payload;

  DomainError({
    required this.code,
    required this.message,
    required this.payload,
  });

  @override
  String toString() => code.name;
}

extension DomainErrorExtension on DomainError {
  DomainError toDomainError() => DomainError(code: code, message: message, payload: payload);
}
