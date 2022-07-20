import 'package:dartz/dartz.dart';
import 'package:ourpass_assessment/core/error/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> createAccount({
    required String name,
    required String email,
    required String password
  });

  Future<Either<Failure, void>> login({
    required String email,
    required String password
  });

  Future<Either<Failure, bool>> checkVerificationStatus({required String userId});
  
  Future<Either<Failure, void>> verifyUser({
    required String userId,
    required String otp
  });
}