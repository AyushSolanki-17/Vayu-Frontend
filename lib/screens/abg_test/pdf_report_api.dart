import 'dart:io';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:vayu/screens/abg_test/pdfApi.dart';

class PdfReportApi {
  static Future<File> generate(
      String descriptive,
      String firstName,
      String lastName,
      String age,
      String gender,
      String compensation,
      String anionGap,
      String paco2,
      String deltaRatio,
      String o2Sat,
      String hco3) async {
    final pdf = Document();

    pdf.addPage(
      MultiPage(
        build: (context) => <Widget>[
          customHeaderLogo(),
          buildCustomHeadline(),
          Header(
              child: Text('Patient Details',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          patientDetails(firstName, lastName, age, gender),
          Header(
              child: Text('Illness Descriptive',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          Paragraph(text: descriptive),
          SizedBox(height: 20),
          Header(
              child: Text('ABG Results given',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          variablesEntered(compensation)
        ],
      ),
    );

    return PdfApi.saveDocument(name: 'report.pdf', pdf: pdf);
  }
}

//Vayu App title
Widget buildCustomHeadline() => Header(
      child: Text(
        'Vayu Report',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: PdfColors.white,
        ),
      ),
      decoration: BoxDecoration(color: PdfColors.blue),
    );

//Cyber Health title
Widget customHeaderLogo() => Row(children: [
      PdfLogo(),
      SizedBox(width: 0.5 * PdfPageFormat.cm),
      Text('Vayu | Team CyberHealth | UIA Hackathon 2022',
          style: TextStyle(fontSize: 20, color: PdfColors.black))
    ]);

// Patient Details
Widget patientDetails(firstName, lastName, age, gender) => Column(children: [
      Text(
          'First name: ' +
              firstName +
              '\nLast name: ' +
              lastName +
              '\nAge: ' +
              age +
              '\nGender: ' +
              gender,
          style: TextStyle(fontSize: 14)),
    ]);

// Details
Widget variablesEntered(compensation) => Column(children: [
      Text('Compensation: ' + compensation, style: TextStyle(fontSize: 14)),
    ]);
