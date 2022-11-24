import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vayu/theme/SizeConfig.dart';

import '../../theme/AppTheme.dart';

class IconTextMenuButton extends StatelessWidget {
  final Function onPressed;
  final Widget icon;
  final String buttonText;
  const IconTextMenuButton(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: const EdgeInsets.all(5.0),
            decoration: const BoxDecoration(
                color: Color.fromRGBO(245,245,245, 1.0),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: IconButton(
              onPressed: () {
                onPressed();
              },
              icon: icon,
              iconSize: 45,
            )),
        Text(
          buttonText.replaceAll(" ", "\n"),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: AppTheme.blackBgBtn,
            fontSize: getProportionateScreenHeight(17),
          ),
        )
      ],
    );
  }
}
