import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ourpass_assessment/config/constants.dart';
import 'package:ourpass_assessment/config/theme.dart';
import 'package:ourpass_assessment/core/base_page.dart';
import 'package:ourpass_assessment/core/widgets/custom_appbar.dart';
import 'package:ourpass_assessment/core/widgets/fill_width_button.dart';
import 'package:ourpass_assessment/features/dashboard/presentation/providers/dashboard_page_provider.dart';


class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return BasePage<DashboardPageProvider>(
      child: null,
      provider: DashboardPageProvider(),
      builder: (context, provider, child) {
        return Scaffold(
          appBar: getCustomAppBar(
            context,
            title: 'Dashboard'
          ),
          body: Padding(
            padding: AppDimensions.globalPadding,
            child: Center(
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(height: AppDimensions.large),
                        SvgPicture.asset(
                          'assets/images/dashboard_banner.svg',
                          width: size.width * 0.6,
                        ),
                        const SizedBox(height: AppDimensions.large),
                        RichText(
                          text: const TextSpan(
                            text: 'Welcome to ',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18
                            ),
                            children: [
                              TextSpan(
                                text: 'ASSESSMENT APP',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600
                                )
                              )
                            ]
                          )
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: AppDimensions.large),
                  FillWidthButton(
                    onPressed: () {}, 
                    text: 'Logout'
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