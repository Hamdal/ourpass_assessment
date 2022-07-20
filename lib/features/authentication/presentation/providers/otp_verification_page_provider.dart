import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ourpass_assessment/core/error/failures.dart';
import 'package:ourpass_assessment/core/router/route_paths.dart';
import 'package:ourpass_assessment/features/authentication/domain/usecases/verify_user.dart';

class OTPVerificationPageProvider with ChangeNotifier {
  final FirebaseAuth firebaseAuth;
  final VerifyUser verifyUser;
  User? user;
  final otpController = TextEditingController();

  bool loading = false;

  OTPVerificationPageProvider({
    required this.firebaseAuth,
    required this.verifyUser
  }) {
    user = firebaseAuth.currentUser;
    notifyListeners();
  }

  void initVerifyUser(BuildContext context) async {
    if (otpController.value.text.length != 6) {
      Fluttertoast.showToast(msg: 'Invalid OTP');
      return;
    }

    if (user == null) {
      Fluttertoast.showToast(msg: 'Invalid user');
    }

    loading = true;
    notifyListeners();

    final params = VerifyUserParams(
      userId: user!.uid, 
      otp: otpController.value.text
    );
    final result = await verifyUser(params);
    result.fold(
      (l) {
        Fluttertoast.showToast(msg: (l as RemoteFailure).message);
        loading = false;
        notifyListeners();
      }, 
      (r) {
        Fluttertoast.showToast(msg: 'Account was successfully verified.');
        loading = false;
        notifyListeners();
        Navigator.of(context).pushNamedAndRemoveUntil(
          RoutePaths.dashboardPage,
          (route) => false
        );
      });
  }
}