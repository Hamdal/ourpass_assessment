import 'package:flutter/material.dart';
import 'package:ourpass_assessment/config/constants.dart';
import 'package:ourpass_assessment/config/theme.dart';
import 'package:ourpass_assessment/core/base_page.dart';
import 'package:ourpass_assessment/core/util/input_validators.dart';
import 'package:ourpass_assessment/core/widgets/custom_appbar.dart';
import 'package:ourpass_assessment/core/widgets/custom_text_input.dart';
import 'package:ourpass_assessment/core/widgets/fill_width_button.dart';
import 'package:ourpass_assessment/features/authentication/presentation/providers/create_account_page_provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';


class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return BasePage<CreateAccountPageProvider>(
      child: null,
      provider: CreateAccountPageProvider(
        createAccount: Provider.of(context)
      ), 
      builder: (context, provider, child) {
        return Scaffold(
          appBar: getCustomAppBar(context),
          body: Padding(
            padding: AppDimensions.globalPadding,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Create Account',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24
                          ),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: size.width * 0.7,
                          child: RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                                overflow: TextOverflow.ellipsis
                              ),
                              children: [
                                TextSpan(
                                  text: 'Please fill the details below to create an '
                                ),
                                TextSpan(
                                  text: 'ASSESSMENT APP ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w600,
                                    overflow: TextOverflow.ellipsis
                                  )
                                ),
                                TextSpan(
                                  text: 'account'
                                ),
                              ]
                            )
                          ),
                        ),
                        const SizedBox(height: 48),
                        Form(
                          key: provider.formKey,
                          child: Column(
                            children: [
                              CustomTextInput(
                                controller: provider.nameController,
                                hintText: 'Name',
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value) => baseValidator(value!),
                              ),
                              const SizedBox(height: 18),
                              CustomTextInput(
                                controller: provider.emailController,
                                hintText: 'Email',
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value) => emailValidator(value!),
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
                        const SizedBox(height: 12),
                        const Text(
                          '*Password must be at least 6 characters long',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black45
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                Hero(
                  tag: 'create-account-button',
                  child: FillWidthButton(
                    onPressed: () {
                      if (provider.loading) return;
                      if (!provider.formKey.currentState!.validate()) return;

                      provider.initCreateAccount(context);
                    },
                    text: 'Create account',
                    loading: provider.loading,
                  ),
                ),
                const SizedBox(height: 14),
              ],
            ),
          ),
        );
      },
    );    
  }
}