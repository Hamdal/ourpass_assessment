import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ourpass_assessment/core/error/failures.dart';
import 'package:ourpass_assessment/features/authentication/domain/usecases/login.dart';

class LoginPageProvider with ChangeNotifier {
  final LoginUser login;
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool hidePassword = true;
  bool loading = false;

  LoginPageProvider({required this.login});

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
}