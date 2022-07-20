import 'package:flutter_easyloading/flutter_easyloading.dart';

void showLoading() {
  EasyLoading.show(
    maskType: EasyLoadingMaskType.black
  );
}

void dismissLoading() {
  EasyLoading.dismiss();
}