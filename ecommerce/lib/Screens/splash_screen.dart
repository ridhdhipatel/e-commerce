import 'dart:async';

import 'package:flutter/material.dart';

import '../Constants/constants.dart';
import '../Screens/screens.dart';
import '../Routes/routes.dart';
import '../Utils/utils.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = PageRoutes.splash;
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;
  late Shared shared;
  @override
  void initState() {
    super.initState();
    shared = Shared();
    startTimer();
  }

  startTimer() {
    timer = Timer(const Duration(seconds: 3), () {
      navigateUser();
    });
  }

  navigateUser() {
    shared.getLogin().then((isLogin) {
      if (isLogin) {
        Navigator.of(context).pushReplacementNamed(BaseScreen.routeName);
      } else {
        Navigator.of(context)
            .pushReplacementNamed(IntroductionJewelleryScreen.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          AppImages.drawerImage,
          scale: 4,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
