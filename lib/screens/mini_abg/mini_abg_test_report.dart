import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vayu/components/buttons/PrimaryTextButton.dart';
import 'package:vayu/components/report_boxes/SimpleReportBox.dart';
import 'package:vayu/components/textfields/NumberInputField.dart';
import 'package:vayu/models/abg_test.dart';
import 'package:vayu/theme/AppTheme.dart';
import 'package:vayu/theme/SizeConfig.dart';
import 'package:http/http.dart' as http;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../../models/mini_abg.dart';

class MiniAbgTestReport extends StatelessWidget {
  final MiniAbgResponse abgTestResponse;

  const MiniAbgTestReport({super.key, required this.abgTestResponse});

  Future<void> generatePDF(AbgTestResponse) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Column(
            children: [
              pw.Center(child: pw.Text("VAYU REPORT",style: pw.TextStyle(fontSize: 18.0))),
              pw.Text("Patient Name: Ayush Solanki",style: pw.TextStyle(fontSize: 18.0)),
              pw.Text("Patient Email: ayush17solanki@gmail.com"),
            ]
          ),
        ),
      ),
    );

    final file = File('report.pdf');
    await file.writeAsBytes(await pdf.save());
  }

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
                            reportType: "HCO3: ",
                            reportData: abgTestResponse.hco3.toString()),
                        SingleLineReportBox(
                            reportType: "PaCo2: ",
                            reportData: abgTestResponse.paco2.toString()),
                      ],
                    ),
                    SizedBox(height: 10.0,),
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
