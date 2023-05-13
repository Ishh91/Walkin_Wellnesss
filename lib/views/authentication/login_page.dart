import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../app_styles.dart';
import '../../size_configs.dart';
import '../../validators.dart';
import '../../widgets/buttons/button.dart';
import '../../widgets/buttons/small_text_buttons.dart';
import '../pages.dart';
import '../../widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  // ignore: override_on_non_overriding_member
  List<FocusNode> _loginFocusNodes = [
    FocusNode(),
    FocusNode(),
  ];
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    double height = SizeConfig.blockSizeV!;
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              hexStringToColor("CB2B93"),
              hexStringToColor("9546C4"),
              hexStringToColor("5E61F4")
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Column(
          children: [
            Container(
              width: w,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      child: Image.asset(
                          'assets/images/auth/signup_illustration.png'),
                    ),
                  ),
                  SizedBox(
                    height: height * 2,
                  ),
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
                          reusableTextField("Enter Email Id",
                              Icons.person_outline, false, emailController),
                          const SizedBox(
                            height: 20,
                          ),
                          reusableTextField("Enter Password", Icons.lock_outlined,
                              true, passwordController),
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
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WelcomePage()),
                    );
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
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
      ),
    );
  }
}
