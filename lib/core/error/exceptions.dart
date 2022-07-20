class RemoteException implements Exception {
  final String message;

  RemoteException({required this.message});
}

class FirestoreException implements Exception {}
class UnverifiedAccountException implements Exception {}