import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vayu/components/buttons/PrimaryTextButton.dart';
import 'package:vayu/components/textfields/NumberInputField.dart';
import 'package:vayu/models/abg_test.dart';
import 'package:vayu/screens/abg_test/abg_test_report.dart';
import 'package:vayu/theme/AppTheme.dart';
import 'package:vayu/theme/SizeConfig.dart';
import 'package:http/http.dart' as http;

import '../../models/mini_abg.dart';
import 'mini_abg_test_report.dart';

class MiniAbgTest extends StatefulWidget {
  const MiniAbgTest({super.key});

  @override
  State<MiniAbgTest> createState() => _MiniAbgTestState();
}

class _MiniAbgTestState extends State<MiniAbgTest> {
  MiniAbgRequest abgTestRequest = MiniAbgRequest();
  TextEditingController paco2Controller = TextEditingController();
  TextEditingController hco3Controller = TextEditingController();

  bool showProcessing = false;
  void checkInputs() {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    if (
        paco2Controller.text.isEmpty ||
        hco3Controller.text.isEmpty
        ) {
      AlertDialog alert = AlertDialog(
        title: const Text("Error"),
        content:
            const Text("Please Fill all the fields with appropriate value"),
        actions: [
          okButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppTheme.screenBgWhite,
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(50),
            horizontal: getProportionateScreenWidth(15)),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: AppTheme.primaryGreen,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(5),
                    horizontal: getProportionateScreenWidth(5)),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back_ios_new_sharp)),
                    Expanded(
                        child: Center(
                            child: Text(
                      'ABG Test',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppTheme.white,
                          fontWeight: FontWeight.w800,
                          fontSize: getProportionateScreenHeight(25)),
                    ))),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(25),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    NumberInputField(
                      controller: paco2Controller,
                      labelText: "Enter PaCO2 value",
                    ),
                    NumberInputField(
                        controller: hco3Controller,
                        labelText: "Enter HCO3 value"),

                    PrimaryTextButton(
                        buttontext: "Check Results",
                        onPressed: () async {
                          checkInputs();
                          abgTestRequest.user = 5;
                          abgTestRequest.paco2 =
                              double.parse(paco2Controller.text);
                          abgTestRequest.hco3 =
                              double.parse(hco3Controller.text);
                          setState(() {
                            showProcessing = true;
                          });
                          final abgReport = await miniAbgRequest(abgTestRequest);

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  MiniAbgTestReport(abgTestResponse: abgReport)));
                        }),
                    showProcessing
                        ? const CircularProgressIndicator()
                        : SizedBox(
                            height: getProportionateScreenHeight(10),
                          )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
