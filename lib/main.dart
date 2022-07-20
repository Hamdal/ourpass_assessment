import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ourpass_assessment/core/app_model.dart';
import 'package:ourpass_assessment/core/provider/provider_setup.dart';
import 'package:ourpass_assessment/core/router/route_paths.dart';
import 'package:ourpass_assessment/core/router/router.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  MyApp({Key? key}) : super(key: key);

  final Future<FirebaseApp> _firebaseInitialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _firebaseInitialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return const FirebaseError();
        }

        // Once complete, show application
        if (snapshot.connectionState == ConnectionState.done) {
          return const MyFirebaseApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return const Loading();
      }
    );
  }
}

class MyFirebaseApp extends StatelessWidget {
  const MyFirebaseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      builder: (context, child) {
        EasyLoading.instance
            ..displayDuration = const Duration(milliseconds: 2000)
            ..indicatorType = EasyLoadingIndicatorType.chasingDots
            ..loadingStyle = EasyLoadingStyle.light
            ..indicatorSize = 45.0
            ..radius = 10.0
            ..contentPadding = const EdgeInsets.all(40)
            ..progressColor = Colors.yellow
            ..backgroundColor = Colors.green
            ..indicatorColor = Colors.yellow
            ..textColor = Colors.yellow
            ..maskColor = Colors.black.withOpacity(0.8)
            ..userInteractions = false
            ..dismissOnTap = false;
        
        return ChangeNotifierProvider.value(
          value: AppModel(),
          builder: (context, child) {
            final appModel = Provider.of<AppModel>(context);
            appModel.init();
            
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: RoutePaths.splashScreen,
              onGenerateRoute: AppRouter.generateRoute,
              builder: EasyLoading.init(),
            );
          },
        );
      },
    );
  }
}

class FirebaseError extends StatelessWidget {
  const FirebaseError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('An error occurred initialising Firebase'),
        ),
      ),
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Loading'),
        ),
      ),
    );
  }
}