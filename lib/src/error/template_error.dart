import 'generic_error.dart';

class TemplateError extends ApplicationError {
  TemplateError(super.originalErrorMessage,
      {super.errorCode,
      super.stackTrace,
      super.externalSource,
      String? templateMessageCode,
      this.values})
      : templateMessageCode = templateMessageCode ??
            (externalSource == null
                ? (errorCode ?? originalErrorMessage)
                : ('$externalSource-${errorCode ?? originalErrorMessage}'));

  /// It is an unique identifier for the message, if not defined defaults to
  /// the error code, for internal errors, and to External Source-Error code for
  /// the external sources
  /// The main logic for this field is to be used as identifier for translation
  /// utilities
  final String templateMessageCode;
  final List? values;

  @override
  bool operator ==(other) =>
      other is TemplateError &&
      templateMessageCode == other.templateMessageCode;

  @override
  int get hashCode => templateMessageCode.hashCode;
}
