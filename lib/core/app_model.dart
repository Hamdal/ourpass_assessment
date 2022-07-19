
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class AppModel with ChangeNotifier {
  bool isBiometricAuthAvailable = false;
  final LocalAuthentication auth = LocalAuthentication();
  
  bool initRan = false;

  void init() async {
    if (initRan) return;
    initRan = true;

    // init biometrics
    await initBiometrics();

    notifyListeners();
  }

  Future<void> initBiometrics() async {
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate = canAuthenticateWithBiometrics 
      || await auth.isDeviceSupported();
    isBiometricAuthAvailable = canAuthenticate;
  }
}