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
          vertical: getProportionateScreenHeight(25),
        ),
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: const BoxDecoration(
                  color: AppTheme.primaryGreen,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  )),
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
              height: getProportionateScreenHeight(20),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        MultipleLineReportBox(
                            reportType: "Disorder Type: ",
                            reportData: abgTestResponse.disorder.toString()),
                        SizedBox(
                          width: 20,
                        ),
                        MultipleLineReportBox(
                            reportType: "Compensation: ",
                            reportData:
                                abgTestResponse.compensation.toString()),
                      ],
                    ),
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
                    const SizedBox(
                      height: 40.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Center(
                        child: Container(
                          height: 40,
                          child: ElevatedButton(
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
                                  abgTestResponse.deltaRatio.toString(),
                                  abgTestResponse.hco3.toString());

                              PdfApi.openFile(pdfFile);
                            },
                            // ignore: sort_child_properties_last
                            child: const Text(
                              'View/Download Report',
                              style: TextStyle(fontSize: 16),
                            ),
                            style: ElevatedButton.styleFrom(
                                elevation: 0.0,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                backgroundColor: AppTheme.primaryGreen),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Connect To Doctor',
                              style: TextStyle(fontSize: 16)),
                          style: ElevatedButton.styleFrom(
                              elevation: 0.0,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              backgroundColor: AppTheme.primaryGreen),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
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
