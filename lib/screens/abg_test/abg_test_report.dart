import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vayu/components/buttons/PrimaryTextButton.dart';
import 'package:vayu/components/report_boxes/SimpleReportBox.dart';
import 'package:vayu/components/textfields/NumberInputField.dart';
import 'package:vayu/models/abg_test.dart';
import 'package:vayu/screens/abg_test/pdfApi.dart';
import 'package:vayu/screens/abg_test/pdf_report_api.dart';
import 'package:vayu/theme/AppTheme.dart';
import 'package:vayu/theme/SizeConfig.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:pdf/pdf.dart';

class AbgTestReport extends StatelessWidget {
  final AbgTestResponse abgTestResponse;

  const AbgTestReport({super.key, required this.abgTestResponse});

  @override
  Widget build(BuildContext context) {
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
                      'ABG Test Report',
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
                        reportType: "Disorder Type: ",
                        reportData: abgTestResponse.disorder.toString()),
                    MultipleLineReportBox(
                        reportType: "Compensation: ",
                        reportData: abgTestResponse.compensation.toString()),
                    MultipleLineReportBox(
                        reportType: "Descriptive Report: ",
                        reportData: abgTestResponse.report.toString()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SingleLineReportBox(
                            reportType: "Anion Gap: ",
                            reportData: abgTestResponse.anionGap.toString()),
                        SingleLineReportBox(
                            reportType: "PaCo2: ",
                            reportData: abgTestResponse.paco2.toString()),
                      ],
                    ),
                    if (abgTestResponse.isMetabolicAcidosis == true)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SingleLineReportBox(
                              reportType: "Anion Gap Result: ",
                              reportData:
                                  abgTestResponse.anionGapResult.toString()),
                          SingleLineReportBox(
                              reportType: "Delta Ratio Result: ",
                              reportData:
                                  abgTestResponse.deltaRatioResult.toString()),
                        ],
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SingleLineReportBox(
                            reportType: "Delta Ratio: ",
                            reportData: abgTestResponse.deltaRatio.toString()),
                        SingleLineReportBox(
                            reportType: "O2Sat: ",
                            reportData: abgTestResponse.o2sat.toString()),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SingleLineReportBox(
                            reportType: "HCO3: ",
                            reportData: abgTestResponse.hco3.toString()),
                        SingleLineReportBox(
                            reportType: "PaO2: ",
                            reportData: abgTestResponse.paco2.toString()),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SingleLineReportBox(
                            reportType: "Na: ",
                            reportData: abgTestResponse.na.toString()),
                        SingleLineReportBox(
                            reportType: "Cl: ",
                            reportData: abgTestResponse.cl.toString()),
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    ElevatedButton(onPressed: (){}, child: const Text('Connect To Doctor'), style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255,93, 154, 252)),),
                    SizedBox(height: 10.0,),
                    ElevatedButton(
                      onPressed: () async {
                        final pdfFile = await PdfReportApi.generate(
                          abgTestResponse.report.toString(),
                          'Girish',
                          'Soodeelah',
                          '23',
                          'Male',
                          abgTestResponse.disorder.toString(),
                          abgTestResponse.compensation.toString(),
                          abgTestResponse.anionGapResult.toString(),
                          abgTestResponse.paco2.toString(),
                          abgTestResponse.deltaRatioResult.toString(),
                          abgTestResponse.o2sat.toString(),
                        );

                        PdfApi.openFile(pdfFile);
                      },
                      child: Text('Create & download as PDF'),
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
