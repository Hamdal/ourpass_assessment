import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ourpass_assessment/core/error/failures.dart';
import 'package:ourpass_assessment/core/usecases/usecase.dart';
import 'package:ourpass_assessment/features/authentication/data/repository/auth_repository_impl.dart';

class LoginUser extends UseCase<void, LoginUserParams> {
  final AuthRepositoryImpl repository;

  LoginUser({required this.repository});
  
  @override
  Future<Either<Failure, void>> call(LoginUserParams params) async{
    return await repository.login(
      email: params.email,
      password: params.password,
    );
  }
}

class LoginUserParams extends Equatable {
  final String email;
  final String password;

  const LoginUserParams({
    required this.email,
    required this.password
  });

  @override
  List<Object?> get props => [email];
}