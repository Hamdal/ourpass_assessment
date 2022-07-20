import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ourpass_assessment/core/error/exceptions.dart';
import 'package:ourpass_assessment/core/error/failures.dart';
import 'package:ourpass_assessment/core/util/error_to_message_mapper.dart';
import 'package:ourpass_assessment/features/authentication/data/datasources/remote_data_source_impl.dart';
import 'package:ourpass_assessment/features/authentication/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSourceImpl dataSource;

  AuthRepositoryImpl({required this.dataSource});
  
  @override
  Future<Either<Failure, void>> createAccount({
    required String name,
    required String email,
    required String password
  }) async {
    try {
      await dataSource.createAccount(email: email, name: name, password: password);
      return const Right(null);
    } on FirebaseAuthException catch(e) {
      return Left(RemoteFailure(message: getFirebaseErrorMessageFromCode(e.code)));
    } on Exception {
      return Left(RemoteFailure(message: 'An error occurred. Please try again'));
    }
  }
  
  @override
  Future<Either<Failure, void>> login({
    required String email, 
    required String password
  }) async {
    try {
      await dataSource.login(email: email, password: password);
      return const Right(null);
    } on FirebaseAuthException catch(e) {
      return Left(RemoteFailure(message: getFirebaseErrorMessageFromCode(e.code)));
    } on UnverifiedAccountException {
      return Left(UnverifiedAccountFailure());
    }
     on Exception {
      return Left(RemoteFailure(message: 'An error occurred. Please try again'));
    }
  }
}