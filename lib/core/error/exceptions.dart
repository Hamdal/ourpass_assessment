class RemoteException implements Exception {
  final String message;

  RemoteException({required this.message});
}

class UnverifiedAccountException implements Exception {}