import 'package:flutter/material.dart';

import '../Widgets/widgets.dart';
import '../Constants/constants.dart';
import '../Helpers/helpers.dart';
import '../Routes/routes.dart';

class FeedbackScreen extends StatefulWidget {
  static const String routeName = PageRoutes.feedback;
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
          'You Feedback',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Container(
          width: size.width * .96,
          padding: const EdgeInsets.all(5.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: Helpers.textfieldDecoration('Email'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: size.height * .01,
                ),
                TextFormField(
                  controller: _subController,
                  decoration: Helpers.textfieldDecoration('Subject'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: size.height * .01,
                ),
                TextFormField(
                  controller: _messageController,
                  decoration: Helpers.textfieldDecoration('Message'),
                  maxLines: 3,
                  textInputAction: TextInputAction.newline,
                  keyboardType: TextInputType.multiline,
                ),
                SizedBox(
                  height: size.height * .03,
                ),
                Container(
                  width: size.width * .5,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  child: const CustomText(
                    text: 'SUBMIT',
                    textStyle: WidgetTheme.buttonTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
