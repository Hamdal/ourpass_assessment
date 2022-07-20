import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ourpass_assessment/core/error/failures.dart';
import 'package:ourpass_assessment/core/usecases/usecase.dart';
import 'package:ourpass_assessment/features/authentication/data/repository/auth_repository_impl.dart';

class CheckVerificationStatus extends UseCase<bool, CheckVerificationStatusParams> {
  final AuthRepositoryImpl repository;

  CheckVerificationStatus({required this.repository});
  
  @override
  Future<Either<Failure, bool>> call(CheckVerificationStatusParams params) async{
    return await repository.checkVerificationStatus(userId: params.userId);
  }
}

class CheckVerificationStatusParams extends Equatable {
  final String userId;

  const CheckVerificationStatusParams({required this.userId});

  @override
  List<Object?> get props => [userId];
}