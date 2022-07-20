import 'package:flutter/material.dart';
import 'package:ourpass_assessment/config/constants.dart';
import 'package:ourpass_assessment/config/theme.dart';
import 'package:ourpass_assessment/core/base_page.dart';
import 'package:ourpass_assessment/core/widgets/custom_appbar.dart';
import 'package:ourpass_assessment/core/widgets/fill_width_button.dart';
import 'package:ourpass_assessment/features/authentication/presentation/providers/otp_verification_page_provider.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';


class OTPVerificationPage extends StatefulWidget {
  const OTPVerificationPage({Key? key}) : super(key: key);

  @override
  State<OTPVerificationPage> createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  @override
  Widget build(BuildContext context) {
    return BasePage<OTPVerificationPageProvider>(
      child: null,
      provider: OTPVerificationPageProvider(
        firebaseAuth: Provider.of(context),
        verifyUser: Provider.of(context)
      ),
      builder: (context, provider, child) {
        return Scaffold(
          appBar: getCustomAppBar(context),
          body: Center(
            child: Padding(
              padding: AppDimensions.globalPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'A verification code was sent to',
                      textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6)
                    ),
                    child: Text(
                      provider.user != null 
                        ? provider.user!.email ?? ''
                        : '',
                      textAlign: TextAlign.start,
                    )
                  ),
                  const SizedBox(height: 48),
                  const Text(
                    'Enter the verification code sent below:',
                  ),
                  const SizedBox(height: 18),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:18),
                    child: PinCodeTextField(
                      appContext: context, 
                      controller: provider.otpController,
                      length: 6,
                      onChanged: (_) {},
                      keyboardType: TextInputType.number,
                      enableActiveFill: true,
                      animationType: AnimationType.fade,
                      cursorHeight: 20,
                      cursorWidth: 2,
                      autoDismissKeyboard: true,
                      autoFocus: true,
                      textStyle: const TextStyle(color: Colors.white),
                      pinTheme: PinTheme(
                        activeColor: AppColors.primary,
                        selectedColor: AppColors.primary,
                        inactiveColor: AppColors.primary,
                        shape: PinCodeFieldShape.circle,
                        activeFillColor: AppColors.primary,
                        selectedFillColor: AppColors.primary,
                        inactiveFillColor: AppColors.primary
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Spacer(),
                  FillWidthButton(
                    onPressed: () {
                      if (provider.loading) return;
                      provider.initVerifyUser(context);
                    },
                    text: 'Verify',
                    loading: provider.loading
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}