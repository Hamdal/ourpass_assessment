import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ourpass_assessment/core/error/failures.dart';
import 'package:ourpass_assessment/core/usecases/usecase.dart';
import 'package:ourpass_assessment/features/authentication/data/repository/auth_repository_impl.dart';


class CreateAccount extends UseCase<void, CreateAccountParams> {
  final AuthRepositoryImpl repository;

  CreateAccount({required this.repository});
  
  @override
  Future<Either<Failure, void>> call(CreateAccountParams params) async{
    return await repository.createAccount(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class CreateAccountParams extends Equatable {
  final String name;
  final String email;
  final String password;

  const CreateAccountParams({
    required this.name, 
    required this.email,
    required this.password
  });

  @override
  List<Object?> get props => [email];
}