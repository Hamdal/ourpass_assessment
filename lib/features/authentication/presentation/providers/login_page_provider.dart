import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ourpass_assessment/core/app_model.dart';
import 'package:ourpass_assessment/core/error/failures.dart';
import 'package:ourpass_assessment/core/util/visual_alerts.dart';
import 'package:ourpass_assessment/features/authentication/domain/usecases/check_verification_status.dart';
import 'package:ourpass_assessment/features/authentication/domain/usecases/login.dart';

class LoginPageProvider with ChangeNotifier {
  final LoginUser login;
  final CheckVerificationStatus checkVerificationStatus;
  final FirebaseAuth firebaseAuth;
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool hidePassword = true;
  bool loading = false;

  LoginPageProvider({
    required this.login,
    required this.checkVerificationStatus,
    required this.firebaseAuth
  });

  void toggleHidePassword() {
    hidePassword = !hidePassword;
    notifyListeners();
  }

  void initLogin(BuildContext context) async {
    if (loading) return;

    loading = true;
    notifyListeners();

    final params = LoginUserParams(
      email: emailController.value.text,
      password: passwordController.value.text
    );

    final result = await login(params);
    result.fold(
      (l) {
        loading = false;
        notifyListeners();
        
        if (l is UnverifiedAccountFailure) {
          Fluttertoast.showToast(msg: 'You need to verify your account');
          // TODO: navigate to OTP page
        } else {
          Fluttertoast.showToast(msg: (l as RemoteFailure).message);
        }
      },
      (r) {
        loading = false;
        notifyListeners();
        // TODO: Navigate to dashboard
      }, 
    );
  }

  void initBiometricLogin(AppModel appModel) async {
    if (firebaseAuth.currentUser == null || !appModel.isBiometricAuthAvailable) {
      return;
    }
    
    showLoading();
    final user = firebaseAuth.currentUser;
    final isAuthenticated = await appModel.initLocalAuth();
    if (isAuthenticated && user != null) {
      final params = CheckVerificationStatusParams(userId: user.uid);
      final result = await checkVerificationStatus(params);
      result.fold(
        (l) {
          dismissLoading();
          Fluttertoast.showToast(msg: (l as RemoteFailure).message);
          notifyListeners();
        },
        (verified) {
          dismissLoading();
          notifyListeners();
          
          if (verified) {
            // TODO: Navigate to dashboard
          } else {
            Fluttertoast.showToast(msg: 'You need to verify your account');
            // TODO: navigate to OTP page
          }
        }
      );
    }
  }
}