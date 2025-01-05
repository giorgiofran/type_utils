class ApplicationError {
  ApplicationError(this.originalErrorMessage,
      {this.errorCode, this.stackTrace, this.externalSource});

  /// The original Error Message represents the error message in the default
  /// language, if internal, or the one coming from the external source
  /// like when an external service or driver is called
  final String originalErrorMessage;

  /// The error code is an identifier for the message
  /// Theoretically, if internal the error code should be unique for each
  /// error message, if external it should also be unique per external source
  final String? errorCode;

  /// The stackTrace, if available
  final StackTrace? stackTrace;

  /// It is an identifier for the source of the error message )external driver,
  /// etc. Each pair of ExternalSource-Error code must be unique.
  final String? externalSource;

  bool get internalError => externalSource == null;

  @override
  bool operator ==(other) =>
      other is ApplicationError &&
      (errorCode == null
          ? originalErrorMessage == other.originalErrorMessage
          : externalSource == other.externalSource &&
              errorCode == other.errorCode);

  @override
  int get hashCode => errorCode == null
      ? originalErrorMessage.hashCode
      : Object.hash(errorCode, externalSource);
}
