import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vayu/components/buttons/PrimaryTextButton.dart';
import 'package:vayu/components/textfields/NumberInputField.dart';
import 'package:vayu/models/abg_test.dart';
import 'package:vayu/screens/abg_test/abg_test_report.dart';
import 'package:vayu/theme/AppTheme.dart';
import 'package:vayu/theme/SizeConfig.dart';
import 'package:http/http.dart' as http;

class AbgTest extends StatefulWidget{
  const AbgTest({super.key});

  @override
  State<AbgTest> createState() => _AbgTestState();
}

class _AbgTestState extends State<AbgTest> {

  AbgTestRequest abgTestRequest = AbgTestRequest();
  TextEditingController phController = TextEditingController();
  TextEditingController paco2Controller = TextEditingController();
  TextEditingController pao2Controller = TextEditingController();
  TextEditingController o2satController = TextEditingController();
  TextEditingController hco3Controller = TextEditingController();
  TextEditingController naController = TextEditingController();
  TextEditingController clController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.screenBgBlack,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(50), horizontal: getProportionateScreenWidth(15)),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: AppTheme.primaryGreen,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(15), horizontal: getProportionateScreenWidth(15)),
                    child: Text('ABG Test', textAlign: TextAlign.center, style: TextStyle(color: AppTheme.white, fontWeight: FontWeight.w800, fontSize: getProportionateScreenHeight(35)),),
                  ),
                ],
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(50),),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    NumberInputField(controller: phController, labelText: "Enter PH value"),
                    NumberInputField(controller: paco2Controller, labelText: "Enter PaCO2 value"),
                    NumberInputField(controller: hco3Controller, labelText: "Enter HCO3 value"),
                    NumberInputField(controller: pao2Controller, labelText: "Enter PAO2 value"),
                    NumberInputField(controller: o2satController, labelText: "Enter O2 SATURATION (%)"),
                    NumberInputField(controller: naController, labelText: "Enter Sodium Ion (Na) value"),
                    NumberInputField(controller: clController, labelText: "Enter Chloride Ion (Cl) value"),
                    PrimaryTextButton(buttontext: "Check Results", onPressed: () async{
                      abgTestRequest.user = 5;
                      abgTestRequest.ph = double.parse(phController.text);
                      abgTestRequest.paco2 = double.parse(paco2Controller.text);
                      abgTestRequest.pao2 = double.parse(pao2Controller.text);
                      abgTestRequest.hco3 = double.parse(hco3Controller.text);
                      abgTestRequest.o2sat = double.parse(o2satController.text);
                      abgTestRequest.na = double.parse(naController.text);
                      abgTestRequest.cl = double.parse(clController.text);
                      final abgReport = await abgRequest(abgTestRequest);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AbgTestReport(abgTestResponse: abgReport)));

                    })
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