import 'package:auvent_intership/config/constants/appData.dart';
import 'package:auvent_intership/core/network/local/cache_helper/cache_helper.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      whichScreen();
    });
  }

  // 3 use cases
  //onboard true and login true   home
  //onboard true and login false  login
  //onboard false   onboarding
  void whichScreen() {
    bool login = CacheHelper.getData(key: "login") ?? false;
    bool onboarding = CacheHelper.getData(key: "onboarding") ?? false;

    if (!onboarding) {
      Navigator.pushReplacementNamed(context, "onboarding");
    } else if (!login) {
      Navigator.pushReplacementNamed(context, "login");
    } else {
      Navigator.pushReplacementNamed(context, "home");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppData.KbackGround,
      body: Center(child: Image.asset("assets/images/logo.png")),
    );
  }
}
