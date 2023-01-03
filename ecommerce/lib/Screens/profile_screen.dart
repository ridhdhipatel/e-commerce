import 'package:flutter/material.dart';

import '../Constants/constants.dart';
import '../Routes/routes.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = PageRoutes.profile;
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.defaultColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 25.0,
            color: AppColors.textColor,
          ),
        ),
        title: const Text(
          'Your Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Container(
            height: size.height * 0.45,
            width: size.width * 0.96,
            margin: EdgeInsets.only(
                top: size.height * 0.08,
                left: size.width * 0.02,
                right: size.width * 0.02),
            child: Card(
              elevation: 10.0,
              child: Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.15, left: 10.0, right: 10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Username',
                          style: WidgetTheme.profileTextStyle,
                        ),
                        Text(
                          'Alexander@0098',
                          style: WidgetTheme.profileTitleTextStyle,
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 2.0,
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Name',
                          style: WidgetTheme.profileTextStyle,
                        ),
                        Text(
                          'Alexander',
                          style: WidgetTheme.profileTitleTextStyle,
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 2.0,
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'City',
                          style: WidgetTheme.profileTextStyle,
                        ),
                        Text(
                          'Tokyo',
                          style: WidgetTheme.profileTitleTextStyle,
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 2.0,
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Mobile Number',
                          style: WidgetTheme.profileTextStyle,
                        ),
                        Text(
                          '+1 1000500023',
                          style: WidgetTheme.profileTitleTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Stack(
              children: [
                Hero(
                  tag: 'profile',
                  child: Container(
                    height: size.height * 0.15,
                    width: size.width * 0.3,
                    margin: EdgeInsets.only(
                      top: size.height * 0.02,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.defaultColor,
                        width: 2.5,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.textGreyColor,
                          offset: Offset(0.0, 0.8),
                          spreadRadius: 1.0,
                          blurRadius: 10.0,
                        ),
                      ],
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  right: 0.0,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(100.0),
                      border:
                          Border.all(color: AppColors.defaultColor, width: 2.0),
                    ),
                    child: const Icon(
                      Icons.camera_alt_rounded,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
