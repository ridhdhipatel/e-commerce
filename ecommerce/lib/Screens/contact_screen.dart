import 'package:flutter/material.dart';

import '../Widgets/widgets.dart';
import '../Constants/constants.dart';
import '../Routes/routes.dart';

class ContactScreen extends StatefulWidget {
  static const String routeName = PageRoutes.constact;
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.defaultColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 25.0,
            color: AppColors.textColor,
          ),
        ),
        title: const Text(
          'Contact',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: size.width * .96,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: AppColors.textColor,
                        width: .7,
                      ),
                    ),
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 30.0,
                          color: AppColors.primaryColor,
                        ),
                        const CustomText(
                          text: 'Address',
                          textStyle: WidgetTheme.contactTitleTextStyle,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return const Text(
                              'tempor orci dapibus ultrices in iaculis nunc sed augue lacus',
                              textAlign: TextAlign.center,
                              style: WidgetTheme.contactDetailTextStyle,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  Container(
                    width: size.width * .96,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: AppColors.textColor,
                        width: .7,
                      ),
                    ),
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.email_outlined,
                          size: 30.0,
                          color: AppColors.primaryColor,
                        ),
                        const CustomText(
                          text: 'Email',
                          textStyle: WidgetTheme.contactTitleTextStyle,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return const Text(
                              'Lorem_ipsum@dolor.sit',
                              textAlign: TextAlign.center,
                              style: WidgetTheme.contactDetailTextStyle,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  Container(
                    width: size.width * .96,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: AppColors.textColor,
                        width: .7,
                      ),
                    ),
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.call,
                          size: 30.0,
                          color: AppColors.primaryColor,
                        ),
                        const CustomText(
                          text: 'Contact Number',
                          textStyle: WidgetTheme.contactTitleTextStyle,
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return const Text(
                                '+91 9632014587',
                                textAlign: TextAlign.center,
                                style: WidgetTheme.contactDetailTextStyle,
                              );
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: size.height * .1,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(.3),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
            ),
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                  text: 'Visit Us Here',
                  textStyle: WidgetTheme.queryTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        AppImages.fbImage,
                        scale: 2,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        AppImages.instaImage,
                        scale: 1.1,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        AppImages.websiteImage,
                        scale: 1.5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
