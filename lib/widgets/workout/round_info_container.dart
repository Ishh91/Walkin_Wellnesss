import 'package:flutter/material.dart';

class RoundInfoContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  const RoundInfoContainer(
      {Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
          Text(subtitle,style: TextStyle(color: Colors.white, fontSize: 16.0),),
        ],
      ),
    );
  }
}
