import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF7b1fa2);
  static const Color primaryLight = Color(0xFFae52d4);
  static const Color green = Color(0xFF037929);
  static const Color orange = Color(0xFFF7A325);
  static const Color grey = Color(0xFFD1D1D1);
}

class AppStrings {
  static const String otp = '123456';
}

class FirestoreCollectionPaths {
  static const String user = 'user';
}

Map<String, String> firebaseErrorMessages = {
  'user-not-found': 'User does not exist.',
  'invalid-email': 'Email address is not valid',
  'user-disabled': 'This account has been disabled. Please contact support',
  'wrong-password': 'Incorrect password',
  'email-already-in-use': 'An account with the provided email already exists. Proceed to login',
  'operation-not-allowed': 'An error occurred. Contact support',
  'weak-password': 'Password is too weak',
  'expired-action-code': 'This code has expired. Click resend to get a new one',
  'invalid-action-code': 'The provided code is not valid'
};