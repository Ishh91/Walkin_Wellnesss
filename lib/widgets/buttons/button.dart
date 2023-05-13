import 'package:flutter/material.dart';

import '../style/styling.dart';

class Button extends StatelessWidget {
  final String btnTxt;
  final VoidCallback onTap;
  final bool border;
  final Color borderColor;
  final bool roundedBorder;

  const Button(
      {Key? key,
        this.roundedBorder = false,
        required this.btnTxt,
        required this.onTap,
        this.border = false,
        required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: border ? Colors.transparent : AppColor.pColor,
      borderRadius: roundedBorder
          ? BorderRadius.circular(PadRadius.radius)
          : BorderRadius.circular(5),
      child: InkWell(
        highlightColor: Colors.grey,
        //  splashColor: border ? AppColor.pColor : null,
        onTap: onTap,
        customBorder: RoundedRectangleBorder(
            borderRadius: roundedBorder
                ? BorderRadius.circular(PadRadius.radius)
                : BorderRadius.circular(5)),
        child: Container(
          height: 53,
          decoration: BoxDecoration(
              border: border ? Border.all(color: borderColor) : null,
              borderRadius: roundedBorder
                  ? BorderRadius.circular(PadRadius.radius)
                  : BorderRadius.circular(5)),
          width: double.infinity,
          child: Center(
            child: Text(
              btnTxt,
              style: AppTextStyle.body16,
            ),
          ),
        ),
      ),
    );
  }
}

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container firebaseUIButton(BuildContext context, String title, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}
