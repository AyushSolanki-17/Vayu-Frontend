import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vayu/components/buttons/PrimaryTextButton.dart';
import 'package:vayu/components/report_boxes/SimpleReportBox.dart';
import 'package:vayu/components/textfields/NumberInputField.dart';
import 'package:vayu/models/abg_test.dart';
import 'package:vayu/theme/AppTheme.dart';
import 'package:vayu/theme/SizeConfig.dart';
import 'package:http/http.dart' as http;


class AbgTestReport extends StatelessWidget {

  final AbgTestResponse abgTestResponse;

  const AbgTestReport({super.key, required this.abgTestResponse});

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
                    child: Text('ABG Test Report', textAlign: TextAlign.center, style: TextStyle(color: AppTheme.white, fontWeight: FontWeight.w800, fontSize: getProportionateScreenHeight(35)),),
                  ),
                ],
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(50),),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SingleLineReportBox(reportType: "Disorder Type: ", reportData: abgTestResponse.disorder.toString()),
                    MultipleLineReportBox(reportType: "Descriptive Report: ", reportData: abgTestResponse.report.toString()),
                    SingleLineReportBox(reportType: "Compensation: ", reportData: abgTestResponse.compensation.toString()),
                    SingleLineReportBox(reportType: "Anion Gap: ", reportData: abgTestResponse.anionGap.toString()),
                    SingleLineReportBox(reportType: "Delta Ratio: ", reportData: abgTestResponse.deltaRatio.toString()),
                      if(abgTestResponse.isMetabolicAcidosis == true)
                        SingleLineReportBox(reportType: "Anion Gap Result: ", reportData: abgTestResponse.anionGapResult.toString()),
                    if(abgTestResponse.isMetabolicAcidosis == true)
                        SingleLineReportBox(reportType: "Delta Ratio Result: ", reportData: abgTestResponse.deltaRatioResult.toString()),
                    SingleLineReportBox(reportType: "PH: ", reportData: abgTestResponse.ph.toString()),
                    SingleLineReportBox(reportType: "PaCo2: ", reportData: abgTestResponse.paco2.toString()),
                    SingleLineReportBox(reportType: "HCO3: ", reportData: abgTestResponse.hco3.toString()),
                    SingleLineReportBox(reportType: "PaO2: ", reportData: abgTestResponse.paco2.toString()),
                    SingleLineReportBox(reportType: "O2Sat: ", reportData: abgTestResponse.o2sat.toString()),
                    SingleLineReportBox(reportType: "Na: ", reportData: abgTestResponse.na.toString()),
                    SingleLineReportBox(reportType: "Cl: ", reportData: abgTestResponse.cl.toString()),
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