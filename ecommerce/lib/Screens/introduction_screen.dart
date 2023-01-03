import 'package:flutter/material.dart';

import '../Screens/screens.dart';
import '../Constants/constants.dart';
import '../Routes/routes.dart';
import '../Widgets/widgets.dart';

class IntroductionJewelleryScreen extends StatefulWidget {
  static const String routeName = PageRoutes.introduction;
  const IntroductionJewelleryScreen({super.key});

  @override
  State<IntroductionJewelleryScreen> createState() =>
      _IntroductionJewelleryScreenState();
}

class _IntroductionJewelleryScreenState
    extends State<IntroductionJewelleryScreen> {
  int currentPage = 0;
  final pageViewController = PageController();
  static const kDuration = Duration(milliseconds: 300);
  static const kCurve = Curves.ease;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  onChangedFunction(int index) {
    setState(() {
      currentPage = index;
    });
  }

  nextFunction() {
    if (currentPage == 2) {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    } else {
      pageViewController.nextPage(duration: kDuration, curve: kCurve);
    }
  }

  previousFunction() {
    pageViewController.previousPage(duration: kDuration, curve: kCurve);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            onPageChanged: onChangedFunction,
            children: [
              Image.asset(
                AppImages.intro1Image,
                fit: BoxFit.fill,
              ),
              Image.asset(
                AppImages.intro2Image,
                fit: BoxFit.fill,
              ),
              Image.asset(
                AppImages.intro3Image,
                fit: BoxFit.fill,
              ),
            ],
          ),
          Positioned(
            bottom: size.height * 0.03,
            child: SizedBox(
              width: size.width,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Indicator(
                    positionIndex: 0,
                    currentIndex: currentPage,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Indicator(
                    positionIndex: 1,
                    currentIndex: currentPage,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Indicator(
                    positionIndex: 2,
                    currentIndex: currentPage,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.03,
            child: Container(
              width: size.width,
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () => previousFunction(),
                    child: Text(
                      currentPage > 0 ? "<< Previous" : "",
                      style: const TextStyle(
                        color: AppColors.textGreyColor,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  InkWell(
                    onTap: () => nextFunction(),
                    child: Text(
                      currentPage == 2 ? "Done" : "Next >>",
                      style: const TextStyle(
                        color: AppColors.textGreyColor,
                        fontSize: 18.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
