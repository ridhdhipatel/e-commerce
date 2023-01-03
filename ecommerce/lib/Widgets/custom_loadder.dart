import 'package:flutter/cupertino.dart';

import '../Constants/constants.dart';

class CommonLoaderOverlay extends StatelessWidget {
  const CommonLoaderOverlay({
    required this.visibile,
    Key? key,
  }) : super(key: key);

  final bool visibile;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visibile,
      child: Stack(
        children: [
          ModalBarrier(
            color: AppColors.textColor.withOpacity(0.2),
          ),
          Center(
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.defaultColor,
              ),
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  CupertinoActivityIndicator(
                    color: AppColors.textColor,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  DefaultTextStyle(
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.7,
                    ),
                    child: Text(
                      'Please Wait',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
