import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ourpass_assessment/config/constants.dart';
import 'package:ourpass_assessment/features/authentication/data/datasources/remote_data_source.dart';

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;

  AuthRemoteDataSourceImpl({required this.firestore, required this.firebaseAuth});
  
  @override
  Future<void> createAccount({
    required String name, 
    required String email,
    required String password
  }) async {
    final user = firebaseAuth.currentUser;
    if (user == null) {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password
      );

      final userCollection = firestore.collection(FirestoreCollectionPaths.user);
      await userCollection.doc(credential.user!.uid).set({
        'name': name,
        'email': email,
        'verified': false,
        'created': FieldValue.serverTimestamp()
      });
    }
  }
}