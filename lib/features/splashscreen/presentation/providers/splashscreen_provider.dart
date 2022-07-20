import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:ourpass_assessment/core/router/route_paths.dart';

class SplashscreenProvider with ChangeNotifier {
  final FirebaseAuth firebaseAuth;
  bool initRan = false;

  SplashscreenProvider({required this.firebaseAuth});

  void init(BuildContext context) async {
    if (initRan) return;
    
    final user = firebaseAuth.currentUser;
    if (user == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacementNamed(
          RoutePaths.authSelectionPage
        );
      });
    } else {
      // user is signed in. Navigate to login screen
    }
  }
}