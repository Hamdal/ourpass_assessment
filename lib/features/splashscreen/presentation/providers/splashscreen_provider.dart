import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class SplashscreenProvider with ChangeNotifier {
  final FirebaseAuth firebaseAuth;

  SplashscreenProvider({required this.firebaseAuth});

  void init() async {
    final user = firebaseAuth.currentUser;
    if (user == null) {
      // user is not signed in. Navigate to auth selection screen
    } else {
      // user is signed in. Navigate to login screen
    }
  }
}