import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../Helpers/helpers.dart';
import '../Models/models.dart';
import '../Providers/providers.dart';
import '../Screens/screens.dart';
import '../Constants/constants.dart';
import '../Routes/routes.dart';
import '../Utils/utils.dart';
import '../Widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = PageRoutes.login;
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey();
  final GlobalKey<FormState> _registerFormKey = GlobalKey();
  late LoginProvider loginProvider;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _customerNameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  final FocusNode _usernameNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final FocusNode _customerNameNode = FocusNode();
  final FocusNode _nameNode = FocusNode();
  final FocusNode _cityNode = FocusNode();
  final FocusNode _mobileNode = FocusNode();

  bool isUsernameValidate = false;
  bool isPasswordValidate = false;
  bool isCustomerNameValidate = false;
  bool isNameValidate = false;
  bool isCityValidate = false;
  bool isMobileValidate = false;

  bool isLogin = false;
  bool isRegester = false;

  @override
  void initState() {
    super.initState();
    loginProvider = Provider.of<LoginProvider>(context, listen: false);
  }

  onLogin() {
    if (_loginFormKey.currentState!.validate()) {
      var username = _usernameController.text;
      var password = _passwordController.text;
      var loginRequest = customerLoginToJson(
        CustomerLogin(
          username: username,
          password: password,
          adminId: Consts.adminId,
        ),
      );

      loginProvider.customerLogin(loginRequest).then((response) {
        Helpers.showToast(response);
      });
    } else {
      Helpers.showToast('Username and password requried');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
            child: Image.asset(
              AppImages.loginImage,
              fit: BoxFit.fill,
            ),
          ),
          Visibility(
            visible: isLogin || isRegester,
            child: Positioned(
              top: size.height * 0.1,
              left: size.width * 0.025,
              right: size.width * 0.025,
              child: Stack(
                children: [
                  Visibility(
                    visible: isLogin,
                    child: Container(
                      width: size.width * 0.95,
                      decoration: BoxDecoration(
                        color: AppColors.textGreyColor.withOpacity(1),
                        border: Border.all(
                            color: AppColors.primaryColor, width: 1.5),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: loginForm(size, context),
                    ),
                  ),
                  Visibility(
                    visible: isRegester,
                    child: Container(
                      width: size.width * 0.95,
                      decoration: BoxDecoration(
                        color: AppColors.textGreyColor.withOpacity(1),
                        border: Border.all(
                            color: AppColors.primaryColor, width: 1.5),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: registerForm(size),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: (isLogin || isRegester) ? false : true,
            child: Positioned(
              bottom: size.height * 0.01,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isLogin = !isLogin;
                        });
                        // Navigator.of(context)
                        //     .pushReplacementNamed(BaseScreen.routeName);
                      },
                      child: Container(
                        height: 40.0,
                        width: size.width * 0.95,
                        margin: EdgeInsets.only(bottom: size.height * 0.05),
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        alignment: Alignment.center,
                        child: const CustomText(
                          text: 'Login',
                          textStyle: WidgetTheme.buttonTextStyle,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.001,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isRegester = !isRegester;
                        });
                      },
                      child: Container(
                        height: 40.0,
                        width: size.width * 0.95,
                        margin: EdgeInsets.only(bottom: size.height * 0.05),
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        alignment: Alignment.center,
                        child: const CustomText(
                          text: 'Register',
                          textStyle: WidgetTheme.buttonTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  registerForm(Size size) {
    return Form(
      key: _registerFormKey,
      child: Column(
        children: [
          const CustomText(
            text: 'Register',
            textStyle: WidgetTheme.loginTitleTextStyle,
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          TextFormField(
            controller: _customerNameController,
            focusNode: _customerNameNode,
            autovalidateMode: isCustomerNameValidate
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            decoration: Helpers.textfieldDecoration('Customer Name'),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            maxLines: 1,
            cursorColor: AppColors.primaryColor,
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          TextFormField(
            controller: _nameController,
            focusNode: _nameNode,
            autovalidateMode: isNameValidate
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            decoration: Helpers.textfieldDecoration('Username'),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            maxLines: 1,
            cursorColor: AppColors.primaryColor,
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          TextFormField(
            controller: _cityController,
            focusNode: _cityNode,
            autovalidateMode: isCityValidate
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            decoration: Helpers.textfieldDecoration('City'),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            maxLines: 1,
            cursorColor: AppColors.primaryColor,
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          TextFormField(
            controller: _mobileController,
            focusNode: _mobileNode,
            autovalidateMode: isMobileValidate
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            decoration: Helpers.textfieldDecoration('Mobile Number'),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            maxLines: 1,
            cursorColor: AppColors.primaryColor,
            inputFormatters: [
              LengthLimitingTextInputFormatter(10),
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          InkWell(
            onTap: () {
              setState(() {
                isLogin = true;
                isRegester = false;
              });
            },
            child: Container(
              width: size.width * 0.8,
              margin: EdgeInsets.only(bottom: size.height * 0.01),
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              alignment: Alignment.center,
              child: const CustomText(
                text: 'Register',
                textStyle: WidgetTheme.buttonTextStyle,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(
                text: 'Already Register? ',
                textStyle: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isLogin = true;
                    isRegester = false;
                  });
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: AppColors.linkColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  loginForm(Size size, BuildContext context) {
    return Form(
      key: _loginFormKey,
      child: Column(
        children: [
          const CustomText(
            text: 'Login',
            textStyle: WidgetTheme.loginTitleTextStyle,
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          TextFormField(
            controller: _usernameController,
            focusNode: _usernameNode,
            autovalidateMode: isUsernameValidate
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            decoration: Helpers.textfieldDecoration('Username'),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            maxLines: 1,
            cursorColor: AppColors.primaryColor,
            onChanged: (String val) {
              if (val.isEmpty) {
                setState(() {
                  isUsernameValidate = true;
                });
              }
              if (val.length > 1) {
                setState(() {
                  isUsernameValidate = false;
                });
              }
            },
            validator: (String? val) {
              if (val!.isEmpty) {
                return 'Username is required';
              }
              return null;
            },
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          TextFormField(
            controller: _passwordController,
            focusNode: _passwordNode,
            autovalidateMode: isPasswordValidate
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            decoration: Helpers.textfieldDecoration('Password'),
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            maxLines: 1,
            cursorColor: AppColors.primaryColor,
            obscureText: true,
            onChanged: (String val) {
              if (val.isEmpty) {
                setState(() {
                  isPasswordValidate = true;
                });
              }
              if (val.length > 1) {
                setState(() {
                  isPasswordValidate = false;
                });
              }
            },
            validator: (String? val) {
              if (val!.isEmpty) {
                return 'Password is required';
              }
              return null;
            },
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          InkWell(
            onTap: () {
              onLogin();
              Navigator.of(context).pushReplacementNamed(BaseScreen.routeName);
            },
            child: Container(
              width: size.width * 0.8,
              margin: EdgeInsets.only(bottom: size.height * 0.01),
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              alignment: Alignment.center,
              child: const CustomText(
                text: 'Login',
                textStyle: WidgetTheme.buttonTextStyle,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(
                text: 'Don\'t have an Account? ',
                textStyle: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isLogin = false;
                    isRegester = true;
                  });
                },
                child: const Text(
                  'Register',
                  style: TextStyle(
                    color: AppColors.linkColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
