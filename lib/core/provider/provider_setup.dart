import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ourpass_assessment/features/authentication/data/datasources/remote_data_source_impl.dart';
import 'package:ourpass_assessment/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:ourpass_assessment/features/authentication/domain/usecases/check_verification_status.dart';
import 'package:ourpass_assessment/features/authentication/domain/usecases/create_account.dart';
import 'package:ourpass_assessment/features/authentication/domain/usecases/login.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
];

List<SingleChildWidget> independentServices = [
  Provider.value(value: FirebaseFirestore.instance),
  Provider.value(value: FirebaseAuth.instance),
];

List<SingleChildWidget> dependentServices = [
  // AUTHENTICATION FEATURE DEPENDENCIES
  ProxyProvider2<FirebaseAuth, FirebaseFirestore, AuthRemoteDataSourceImpl>(
    update: (context, firebaseAuth, firestore, authRemoteDataSource)
      => AuthRemoteDataSourceImpl(firebaseAuth: firebaseAuth, firestore: firestore)
  ),
  ProxyProvider<AuthRemoteDataSourceImpl, AuthRepositoryImpl>(
    update: (context, dataSource, repository)
      => AuthRepositoryImpl(dataSource: dataSource)
  ),
  ProxyProvider<AuthRepositoryImpl, CreateAccount>(
    update: (context, repository, _)
      => CreateAccount(repository: repository)
  ),
  ProxyProvider<AuthRepositoryImpl, LoginUser>(
    update: (context, repository, _)
      => LoginUser(repository: repository)
  ),
  ProxyProvider<AuthRepositoryImpl, CheckVerificationStatus>(
    update: (context, repository, _)
      => CheckVerificationStatus(repository: repository)
  ),
];