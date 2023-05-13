import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_screen/views/authentication/auth_controller.dart';
import '../../app_styles.dart';
import '../../size_configs.dart';
import '../../validators.dart';
import '../../widgets/buttons/button.dart';
import '../../widgets/buttons/large_icon_button.dart';
import '../../widgets/buttons/small_text_buttons.dart';
import '../pages.dart';
import '../../widgets/widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _signUpKey = GlobalKey<FormState>();

  void onSubmit() {
    _signUpKey.currentState!.validate();
  }

  List<FocusNode> _signUpFocusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    super.initState();
    _signUpFocusNodes.forEach((element) {
      element.addListener(() {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var userController = TextEditingController();
    SizeConfig().init(context);
    double height = SizeConfig.blockSizeV!;
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
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Container(
                    child: Image.asset(
                        'assets/images/auth/signup_illustration.png'),
                  ),
                  SizedBox(
                    height: height * 2,
                  ),
                  Text(
                    'Create Your Account',
                    style: kTitle2,
                  ),
                  SizedBox(
                    height: height * 2,
                  ),
                  Form(
                    key: _signUpKey,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
                        ),
                        reusableTextField("Enter UserName",
                            Icons.person_outline, false, userController),
                        const SizedBox(
                          height: 20,
                        ),
                        reusableTextField("Enter Email Id",
                            Icons.person_outline, false, emailController),
                        const SizedBox(
                          height: 20,
                        ),
                        reusableTextField("Enter Password", Icons.lock_outlined,
                            true, passwordController),
                        const SizedBox(
                          height: 20,
                        ),
                        firebaseUIButton(context, "Sign Up", () {
                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text)
                              .then((value) {
                            print("Created New Account");
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => WelcomePage()));
                          }).onError((error, stackTrace) {
                            print("Error ${error.toString()}");
                          });
                        })
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            height: 3,
                            color: kSecondaryColor.withOpacity(0.4),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            height: 3,
                            color: kSecondaryColor.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: kBodyText3,
                      ),
                      SmallTextButton(
                        buttonText: 'Sign in',
                        page: LoginPage(),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 6,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
