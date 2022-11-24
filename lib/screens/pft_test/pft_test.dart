import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vayu/components/buttons/PrimaryTextButton.dart';
import 'package:vayu/components/textfields/NumberInputField.dart';
import 'package:vayu/models/abg_test.dart';
import 'package:vayu/models/pft_test.dart';
import 'package:vayu/screens/abg_test/abg_test_report.dart';
import 'package:vayu/screens/pft_test/pft_test_report.dart';
import 'package:vayu/theme/AppTheme.dart';
import 'package:vayu/theme/SizeConfig.dart';
import 'package:http/http.dart' as http;

class PftTest extends StatefulWidget {
  const PftTest({super.key});

  @override
  State<PftTest> createState() => _PftTestState();
}

class _PftTestState extends State<PftTest> {

  PftRequest pftTest = PftRequest();
  TextEditingController smokingController = TextEditingController();
  TextEditingController diabetesController = TextEditingController();
  TextEditingController fev1Controller = TextEditingController();
  TextEditingController fev1predController = TextEditingController();
  TextEditingController fvcController = TextEditingController();
  TextEditingController fvcpredController = TextEditingController();
  TextEditingController mwtController = TextEditingController();
  TextEditingController catController = TextEditingController();


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
        smokingController.text.isEmpty ||
        diabetesController.text.isEmpty ||
        fev1Controller.text.isEmpty ||
        fev1predController.text.isEmpty ||
        fvcController.text.isEmpty ||
        fvcpredController.text.isEmpty || mwtController.text.isEmpty || catController.text.isEmpty) {
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
                              'PFT Test',
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
                        controller: smokingController, labelText: "Do you smoke? (1 for Yes, 2 for No)"),
                    NumberInputField(
                      controller: diabetesController,
                      labelText: "Do you have diabetes? (1 for Yes, 2 for No)",
                    ),
                    NumberInputField(
                        controller: fvcController,
                        labelText: "Enter FVC value"),
                    NumberInputField(
                        controller: fvcpredController,
                        labelText: "Enter FVC Pred value"),
                    NumberInputField(
                        controller: fev1Controller,
                        labelText: "Enter FEV1 value"),
                    NumberInputField(
                        controller: fev1predController,
                        labelText: "Enter FEV1 Pred value"),
                    NumberInputField(
                        controller: mwtController,
                        labelText: "Enter MWT value"),
                    NumberInputField(
                        controller: catController,
                        labelText: "Enter CAT value"),
                    PrimaryTextButton(
                        buttontext: "Check Results",
                        onPressed: () async {
                          checkInputs();
                          pftTest.user = 5;
                          pftTest.smoking = int.parse(smokingController.text);
                          pftTest.diabetes = int.parse(diabetesController.text);
                          pftTest.fev1 = double.parse(fev1Controller.text);
                          pftTest.fev1pred = double.parse(fev1predController.text);
                          pftTest.fvc = double.parse(fvcController.text);
                          pftTest.fvcpred = double.parse(fvcpredController.text);
                          pftTest.mwt2 = double.parse(mwtController.text);
                          pftTest.cat = double.parse(catController.text);
                          setState(() {
                            showProcessing = true;
                          });
                          final pftReport = await pftRequest(pftTest);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  PftTestReport(pftTestResponse: pftReport)));
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
