import 'package:flutter/material.dart';

import '../Widgets/widgets.dart';
import '../Constants/constants.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CustomText(
          text: 'Ops! Something wrong',
          textStyle: WidgetTheme.titleTextStyle,
        ),
      ),
    );
  }
}
