
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

  Future<bool> initLocalAuth() async {
    if (!isBiometricAuthAvailable) {
      Fluttertoast.showToast(
        msg: 'Biometric Authentication is not available on this device'
      );
      return false;
    }
    
    final List<BiometricType> availableBiometrics = await auth.getAvailableBiometrics();
    if (availableBiometrics.isNotEmpty) {
      try {
        return await auth.authenticate(
          localizedReason: 'Please authenticate to login to ASSESSMENT APP',
          options: const AuthenticationOptions(
            stickyAuth: true
          )
        );
      } on PlatformException {
        Fluttertoast.showToast(
          msg: 'Biometrics Authentication Failed'
        );
        return false;
      }
    }

    Fluttertoast.showToast(
      msg: 'Biometrics Authentication Failed'
    );
    return false;
  }
}