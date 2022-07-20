import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:ourpass_assessment/config/constants.dart';
import 'package:ourpass_assessment/config/theme.dart';
import 'package:ourpass_assessment/core/app_model.dart';
import 'package:ourpass_assessment/core/base_page.dart';
import 'package:ourpass_assessment/core/router/route_paths.dart';
import 'package:ourpass_assessment/core/util/input_validators.dart';
import 'package:ourpass_assessment/core/widgets/custom_appbar.dart';
import 'package:ourpass_assessment/core/widgets/custom_text_input.dart';
import 'package:ourpass_assessment/core/widgets/fill_width_button.dart';
import 'package:ourpass_assessment/features/authentication/presentation/providers/login_page_provider.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {  
  @override
  Widget build(BuildContext context) {
    final appModel = Provider.of<AppModel>(context);
    
    return BasePage<LoginPageProvider>(
      child: null,
      provider: LoginPageProvider(
        login: Provider.of(context),
        checkVerificationStatus: Provider.of(context),
        firebaseAuth: Provider.of(context)
      ), 
      builder: (context, provider, child) {
        return Scaffold(
          appBar: getCustomAppBar(context),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: AppDimensions.globalPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: FlutterLogo(size: 48)
                ),
                const SizedBox(height: 24),
                const Center(
                  child: Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Form(
                  key: provider.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 18),
                      CustomTextInput(
                        controller: provider.emailController,
                        hintText: 'Email',
                        validator: (value) => emailValidator(value!),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        inputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 18),
                      CustomTextInput(
                        controller: provider.passwordController,
                        validator: (value) => passwordValidator(value!),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        hintText: 'Password',
                        inputType: TextInputType.visiblePassword,
                        hideText: provider.hidePassword,
                        suffix: Icon(
                          provider.hidePassword ? MdiIcons.eye : MdiIcons.eyeOff,
                          color: Colors.grey,
                          size: 20,
                        ),
                        onTapSuffix: () => provider.toggleHidePassword(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 72),
                Row(
                  children: [
                    Expanded(
                      child: FillWidthButton(
                        onPressed: () {
                          if (provider.loading) return;
                          if (!provider.formKey.currentState!.validate()) return;

                            provider.initLogin(context);
                        },
                        loading: provider.loading,
                        text: 'Sign in'
                      ),
                    ),
                    const SizedBox(width: 12),
                    Visibility(
                      visible: appModel.isBiometricAuthAvailable 
                        && provider.firebaseAuth.currentUser != null,
                      child: InkWell(
                        onTap: () => provider.initBiometricLogin(appModel),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primary),
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Icon(
                              Icons.fingerprint,
                              size: 28,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 12),
                Center(
                  child: InkWell(
                    onTap: () => Navigator.of(context).pushNamed(
                      RoutePaths.createAccountPage
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                            color: Colors.black54
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Create Account',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}