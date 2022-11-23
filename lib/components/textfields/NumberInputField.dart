import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vayu/theme/AppTheme.dart';
import 'package:vayu/theme/SizeConfig.dart';

class NumberInputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  const NumberInputField(
      {super.key, required this.controller, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5.0),
          TextField(
            cursorColor: AppTheme.primaryGreen,
            style: TextStyle(
                color: AppTheme.primaryGreen,
                fontSize: getProportionateScreenHeight(20)),
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: TextStyle(
                  color: AppTheme.blackBgBtn,
                  fontWeight: FontWeight.w400,
                  fontSize: getProportionateScreenHeight(15)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide:
                    const BorderSide(color: AppTheme.primaryGreen, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide:
                    const BorderSide(color: AppTheme.grayBorder, width: 2.0),
              ),
            ),
            controller: controller,
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
