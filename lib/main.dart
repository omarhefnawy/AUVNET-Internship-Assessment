import 'package:auvent_intership/core/network/local/cache_helper/cache_helper.dart';
import 'package:auvent_intership/features/auth/presentation/auth_bloc/auth_bloc.dart';
import 'package:auvent_intership/features/auth/presentation/screens/regester/regester.dart';
import 'package:auvent_intership/features/introductions/screens/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/dependacy_injection/service_loctor.dart';
import 'features/auth/presentation/screens/login/login.dart';
import 'features/home/presentation/screens/home.dart';
import 'features/introductions/screens/onboarding/onboarding.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // initialize firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //initialize cacheHelper
  CacheHelper.init();
  //service locator
  serviceLocator();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<AuthBloc>(),),
      ],
      child: MaterialApp(
        initialRoute: "/",
        routes: {
          "/": (context) => const SplashScreen(),
          "onboarding": (context) => const OnboardingScreen(),
          "login": (context) => const LoginScreen(),
          "home": (context) => const HomeScreen(),
          "signUp": (context) => const SignUpScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
