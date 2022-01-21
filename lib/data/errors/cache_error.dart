import '../../domain/helpers/helpers.dart' show DomainError, ErrorCode;

class CacheError extends DomainError {
  CacheError.deleteSecureData({final String message = '', final Map<String, dynamic> payload = const {}})
      : super(
          code: ErrorCode.SST01,
          message: message,
          payload: payload,
        );

  CacheError.fetchSecureData({final String message = '', final Map<String, dynamic> payload = const {}})
      : super(
          code: ErrorCode.SST02,
          message: message,
          payload: payload,
        );

  CacheError.saveSecureData({final String message = '', final Map<String, dynamic> payload = const {}})
      : super(
          code: ErrorCode.SST03,
          message: message,
          payload: payload,
        );
}
