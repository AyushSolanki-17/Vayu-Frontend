
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vayu/theme/AppTheme.dart';
import 'package:vayu/theme/SizeConfig.dart';

class NumberInputField extends StatelessWidget{
  final TextEditingController controller;
  final String labelText;
  const NumberInputField({super.key, required this.controller, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labelText,style: TextStyle(color: AppTheme.white,fontWeight: FontWeight.w400, fontSize: getProportionateScreenHeight(20)),),
          const SizedBox(height: 15.0),
          TextField(
            cursorColor: AppTheme.primaryGreen,
            style: TextStyle(color: AppTheme.primaryGreen, fontSize: getProportionateScreenHeight(20)),
            decoration: InputDecoration(

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7.0),
                borderSide: const BorderSide(color: AppTheme.primaryGreen, width: 3.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7.0),
                borderSide: const BorderSide(color: AppTheme.grayBorder, width: 3.0),
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