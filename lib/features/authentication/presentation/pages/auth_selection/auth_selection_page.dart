import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ourpass_assessment/config/constants.dart';
import 'package:ourpass_assessment/core/base_page.dart';
import 'package:ourpass_assessment/core/router/route_paths.dart';
import 'package:ourpass_assessment/core/widgets/fill_width_button.dart';
import 'package:ourpass_assessment/features/authentication/presentation/providers/auth_selection_page_provider.dart';


class AuthSelectionPage extends StatefulWidget {
  const AuthSelectionPage({Key? key}) : super(key: key);

  @override
  State<AuthSelectionPage> createState() => _AuthSelectionPageState();
}

class _AuthSelectionPageState extends State<AuthSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return BasePage<AuthSelectionPageProvider>(
      child: null,
      provider: AuthSelectionPageProvider(),
      builder: (context, provider, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 28,
                vertical: 48
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const FlutterLogo(
                    style: FlutterLogoStyle.horizontal,
                  ),
                  const Spacer(),
                  const SizedBox(height: 12),
                  SvgPicture.asset(
                    'assets/images/banner.svg'
                  ),
                  const SizedBox(height: 12),
                  const Spacer(),
                  const Text(
                    'DO-IT',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary
                    ),
                  ),
                  const SizedBox(height: 48),
                  Hero(
                    tag: 'create-account-button',
                    child: FillWidthButton(
                      onPressed: () => Navigator.of(context).pushNamed(
                        RoutePaths.createAccountPage
                      ),
                      text: 'Create account'
                    ),
                  ),
                  const SizedBox(height: 14),
                  InkWell(
                    onTap: () => Navigator.of(context).pushNamed(
                      RoutePaths.loginPage
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'Already have an account?',
                          style: TextStyle(
                            color: Colors.black54
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Sign in',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
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