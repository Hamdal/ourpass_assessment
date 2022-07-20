import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class FirestoreFailure extends Failure {
  final String code;

  FirestoreFailure({required this.code});
}

class FirebaseAuthFailure extends Failure {
  final String code;

  FirebaseAuthFailure({required this.code});
}

class RemoteFailure extends Failure {
  final String message;

  RemoteFailure({required this.message});
}

class UnverifiedAccountFailure extends Failure {}