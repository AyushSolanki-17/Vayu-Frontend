import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/AppTheme.dart';
import '../../theme/SizeConfig.dart';

class PrimaryTextButton extends StatelessWidget {
  final String buttontext;
  final Function onPressed;

  const PrimaryTextButton(
      {super.key, required this.buttontext, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryGreen,
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0)),
        onPressed: () {
          onPressed();
        },
        child: Text(
          buttontext,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: AppTheme.white,
              fontWeight: FontWeight.w600,
              fontSize: getProportionateScreenHeight(25)),
        ),
      ),
    );
  }
}
