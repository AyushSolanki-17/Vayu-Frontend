import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vayu/components/buttons/PrimaryTextButton.dart';
import 'package:vayu/components/report_boxes/SimpleReportBox.dart';
import 'package:vayu/components/textfields/NumberInputField.dart';
import 'package:vayu/models/abg_test.dart';
import 'package:vayu/models/pft_test.dart';
import 'package:vayu/theme/AppTheme.dart';
import 'package:vayu/theme/SizeConfig.dart';
import 'package:http/http.dart' as http;

class PftTestReport extends StatelessWidget {
  final PftResponse pftTestResponse;
  String severity='Mild';
  PftTestReport({super.key, required this.pftTestResponse});

  @override
  Widget build(BuildContext context) {
    if(pftTestResponse.copdLevel! <= 1)
    {
      severity='Mild';
    }
    else if (pftTestResponse.copdLevel == 2)
      {
        severity='Moderate';
      }

    else if (pftTestResponse.copdLevel == 2)
    {
      severity='Severe';
    }
    else
    {
      severity='Very Severe';
    }
    return Scaffold(
      backgroundColor: AppTheme.white,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(15),
                        horizontal: getProportionateScreenWidth(15)),
                    child: Text(
                      'PFT Test Report',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppTheme.white,
                          fontWeight: FontWeight.w800,
                          fontSize: getProportionateScreenHeight(35)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(50),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MultipleLineReportBox(
                        reportType: "Severity Level: ",
                        reportData: severity),
                    SizedBox(height: 10.0,),
                    SingleLineReportBox(
                        reportType: "Fev1: ",
                        reportData: pftTestResponse.fev1.toString()),
                    SingleLineReportBox(
                        reportType: "FevPred: ",
                        reportData: pftTestResponse.fev1pred.toString()),
                    SingleLineReportBox(
                        reportType: "Fvc: ",
                        reportData: pftTestResponse.fvcpred.toString()),
                    SingleLineReportBox(
                        reportType: "FvcPred: ",
                        reportData: pftTestResponse.fvcpred.toString()),
                    SingleLineReportBox(
                        reportType: "Mwt: ",
                        reportData: pftTestResponse.mwt2.toString()),

                    ElevatedButton(onPressed: (){}, child: const Text('Connect To Doctor'), style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255,93, 154, 252)),)
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
