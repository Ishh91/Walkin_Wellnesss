import 'package:flutter/material.dart';
import 'package:onboarding_screen/views/welcome_page.dart';
import '../../app_styles.dart';
import '../../validators.dart';
import '../../widgets/buttons/small_text_buttons.dart';
import '../pages.dart';
import '../../widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  // ignore: override_on_non_overriding_member
  List<FocusNode> _loginFocusNodes = [
    FocusNode(),
    FocusNode(),
  ];
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: w,
            height: h * 0.2,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/auth/login_bg.png"),
                    fit: BoxFit.cover)),
          ),
          Container(
            width: w,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Sign into your account",
                    style: TextStyle(fontSize: 20, color: Colors.grey.shade500),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 7,
                              blurRadius: 10,
                              offset: Offset(1, 1),
                              color: Colors.grey.withOpacity(0.2))
                        ]),
                    child: Column(
                      children: [
                        MyTextFormField(
                            hint: 'Email',
                            icon: Icons.email_outlined,
                            fillColor: Colors.white,
                            inputType: TextInputType.emailAddress,
                            inputAction: TextInputAction.next,
                            focusNode: _loginFocusNodes[0],
                            validator: emailValidator, Cont: TextEditingController(),),
                        MyPasswordField(
                          fillColor: Colors.white,
                          focusNode: _loginFocusNodes[1],
                          validator: passwordValidator,
                        ),
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    SmallTextButton(
                      buttonText: 'Forgot your Password',
                      page: ResetPassword(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: MyTextButton(
              buttonName: 'Sign In',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomePage()),
                );
              },
              bgColor: kPrimaryColor,
            ),
          ),
          SizedBox(height: w * 0.08),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don`t have an account? ',
                style: kBodyText3,
              ),
              SmallTextButton(
                buttonText: 'Create an Account',
                page: WelcomePage(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
