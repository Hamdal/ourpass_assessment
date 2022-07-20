import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ourpass_assessment/core/error/failures.dart';
import 'package:ourpass_assessment/core/router/route_paths.dart';
import 'package:ourpass_assessment/features/authentication/domain/usecases/create_account.dart';

class CreateAccountPageProvider with ChangeNotifier {
  final CreateAccount createAccount;
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  String? phoneNumber;
  bool hidePassword = true;
  bool loading = false;

  CreateAccountPageProvider({required this.createAccount});

  void toggleHidePassword() {
    hidePassword = !hidePassword;
    notifyListeners();
  }

  initCreateAccount(BuildContext context) async {
    if (loading) return;

    loading = true;
    notifyListeners();

    final params = CreateAccountParams(
      name: nameController.value.text, 
      email: emailController.value.text,
      password: passwordController.value.text
    );

    final response = await createAccount(params);
    response.fold(
      (l) {
        Fluttertoast.showToast(msg: (l as RemoteFailure).message);
        loading = false;
        notifyListeners();
      },
      (r) {
        Fluttertoast.showToast(msg: 'Account created successfully');
        loading = false;
        notifyListeners();
        // TODO: Navigate to otp verification screen
      }, 
    );
  }
}