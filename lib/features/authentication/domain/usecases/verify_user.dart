import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ourpass_assessment/core/error/failures.dart';
import 'package:ourpass_assessment/core/usecases/usecase.dart';
import 'package:ourpass_assessment/features/authentication/data/repository/auth_repository_impl.dart';

class VerifyUser extends UseCase<void, VerifyUserParams> {
  final AuthRepositoryImpl repository;

  VerifyUser({required this.repository});
  
  @override
  Future<Either<Failure, void>> call(VerifyUserParams params) async{
    return await repository.verifyUser(
      userId: params.userId,
      otp: params.otp,
    );
  }
}

class VerifyUserParams extends Equatable {
  final String userId;
  final String otp;

  const VerifyUserParams({
    required this.userId,
    required this.otp
  });

  @override
  List<Object?> get props => [userId];
}