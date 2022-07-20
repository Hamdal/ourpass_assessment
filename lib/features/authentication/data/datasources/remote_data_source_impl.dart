import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ourpass_assessment/config/constants.dart';
import 'package:ourpass_assessment/core/domain/entities/user_profile.dart';
import 'package:ourpass_assessment/core/error/exceptions.dart';
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
  
  @override
  Future<void> login({required String email, required String password}) async {
    final credential = await firebaseAuth.signInWithEmailAndPassword(
      email: email, 
      password: password
    );

    final userCollection = firestore.collection(FirestoreCollectionPaths.user);
    final userDoc = await userCollection.doc(credential.user!.uid).get();
    if (!userDoc.exists) throw UnverifiedAccountException();

    final userProfile = UserProfile.fromJson(json.encode({
      'id': userDoc.id,
      'created': (userDoc.data()!['created'] as Timestamp).toDate().toIso8601String(),
      ...userDoc.data()!..removeWhere((key, value) => key == 'created')
    }));
    if (!userProfile.verified) throw UnverifiedAccountException();
  }
  
  @override
  Future<bool> checkVerificationStatus({required String userId}) async {
    final userCollection = firestore.collection(FirestoreCollectionPaths.user);
    final userDoc = await userCollection.doc(userId).get();
    if (!userDoc.exists) return false;

    final userProfile = UserProfile.fromJson(json.encode({
      'id': userDoc.id,
      'created': (userDoc.data()!['created'] as Timestamp).toDate().toIso8601String(),
      ...userDoc.data()!..removeWhere((key, value) => key == 'created')
    }));
    
    return userProfile.verified;
  }
}