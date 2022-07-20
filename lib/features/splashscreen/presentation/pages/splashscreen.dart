import 'package:flutter/material.dart';
import 'package:ourpass_assessment/core/base_page.dart';
import 'package:ourpass_assessment/features/splashscreen/presentation/providers/splashscreen_provider.dart';
import 'package:provider/provider.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return BasePage<SplashscreenProvider>(
      child: null,
      provider: SplashscreenProvider(
        firebaseAuth: Provider.of(context)
      ),
      builder: (context, provider, child) {
        provider.init();
        
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                FlutterLogo(
                  size: 48,
                ),
                SizedBox(height: 12),
                Text('Assessment')
              ],
            ),
          ),
        );
      },
    );
  }
}