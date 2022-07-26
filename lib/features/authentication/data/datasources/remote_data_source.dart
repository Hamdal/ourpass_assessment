

abstract class AuthRemoteDataSource {
  /// Throws a [RemoteException] for all errors
  Future<void> createAccount({
    required String name,
    required String email,
    required String password
  });

  Future<void> login({required String email, required String password});

  /// Throws a [RemoteException] for all errors
  Future<bool> checkVerificationStatus({required String userId});

  /// Throws a [RemoteException] for all errors
  Future<void> verifyUser({required String userId, required String otp});
}