import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:ourpass_assessment/core/router/route_paths.dart';

class DashboardPageProvider with ChangeNotifier {
  final FirebaseAuth firebaseAuth;

  DashboardPageProvider({required this.firebaseAuth});
  
  void logout(BuildContext context) async {
    await firebaseAuth.signOut();
    Navigator.of(context).pushNamedAndRemoveUntil(
      RoutePaths.authSelectionPage, 
      (route) => false
    );
  }
}