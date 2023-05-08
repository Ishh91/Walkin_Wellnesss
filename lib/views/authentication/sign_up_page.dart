import 'package:flutter/material.dart';
import 'package:onboarding_screen/views/authentication/auth_controller.dart';
import '../../app_styles.dart';
import '../../size_configs.dart';
import '../../validators.dart';
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Container(
                  child:
                  Image.asset('assets/images/auth/signup_illustration.png'),
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
                    children: [
                      MyTextFormField(
                        fillColor: Colors.white,
                        hint: 'Name',
                        icon: Icons.person,
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.name,
                        focusNode: _signUpFocusNodes[0],
                        validator: nameValidator,
                        Cont: userController,
                      ),
                      MyTextFormField(
                        hint: 'Email',
                        icon: Icons.email_outlined,
                        fillColor: Colors.white,
                        inputType: TextInputType.emailAddress,
                        inputAction: TextInputAction.next,
                        focusNode: _signUpFocusNodes[1],
                        validator: emailValidator,
                        Cont: emailController,
                      ),
                      MyPasswordField(
                        fillColor: Colors.white,
                        focusNode: _signUpFocusNodes[2],
                        validator: passwordValidator,
                      ),
                      MyCheckBox(
                        text: 'Keep me signed in',
                      ),
                      MyCheckBox(
                        text: 'Email me ',
                      ),
                      GestureDetector(
                        onTap: () {
                          AuthController.instance
                              .register(emailController.text.trim(), passwordController.text, userController);
                        },
                        child: MyTextButton(
                          buttonName: 'Create Account',
                          onPressed: onSubmit,
                          bgColor: kPrimaryColor,
                        ),
                      ),
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
                      Text(
                        'Or sign in with',
                        style: kBodyText3,
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
                Row(
                  children: [
                    Expanded(
                      child: LargeIconButton(
                        buttonName: 'Google',
                        iconImage: 'assets/images/auth/google_icon.png',
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: LargeIconButton(
                          buttonName: 'Facebook',
                          iconImage: 'assets/images/auth/facebook_icon.png',
                        )),
                  ],
                ),
                SizedBox(
                  height: height * 3,
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
                  height: height * 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

