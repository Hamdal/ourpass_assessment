

abstract class AuthRemoteDataSource {
  /// Throws a [RemoteException] for all errors
  Future<void> createAccount({
    required String name,
    required String email,
    required String password
  });
}