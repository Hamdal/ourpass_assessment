import 'package:ourpass_assessment/config/constants.dart';

String getFirebaseErrorMessageFromCode(String code) {
  return firebaseErrorMessages[code] ?? 'Unknown error';
}

