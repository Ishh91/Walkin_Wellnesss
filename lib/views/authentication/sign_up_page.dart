import 'package:flutter/material.dart';
import 'package:onboarding_screen/app_styles.dart';
import 'package:onboarding_screen/size_configs.dart';
import 'package:onboarding_screen/widgets/my_text_button.dart';

import '../../fields/my_check_box.dart';
import '../../fields/my_password_field.dart';
import '../../fields/my_text_form_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  List<FocusNode> _signUpFocusNode = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _signUpFocusNode.forEach((element) {
      element.addListener(() {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.blockSizeV!;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    MyTextFormField(
                      fillColor: Colors.white,
                      hint: 'Name',
                      icon: Icons.person,
                      inputAction: TextInputAction.next,
                      focusNode: _signUpFocusNode[0],
                      inputType: TextInputType.name,
                    ),
                    MyTextFormField(
                      hint: 'Email',
                      icon: Icons.email,
                      fillColor: Colors.white,
                      inputAction: TextInputAction.next,
                      focusNode: _signUpFocusNode[1],
                      inputType: TextInputType.emailAddress,
                    ),
                    MyPasswordField(
                        fillColor: Colors.white,
                        focusNode: _signUpFocusNode[2]),
                    MyCheckBox(
                      text: 'Keep me signed in',
                    ),
                    MyCheckBox(
                      text: 'Email us about more',
                    ),
                    MyTextButton(
                      buttonName: 'Create Account',
                      onPressed: () {},
                      bgColor: kPrimaryColor,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
