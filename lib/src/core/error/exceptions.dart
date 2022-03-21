class ServerException implements Exception {
  const ServerException(this.friendlyMessage, this.cause);

  final String friendlyMessage;
  final Object cause;

  List<Object> get props => [friendlyMessage, cause];
}
