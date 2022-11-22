import 'package:flutter/cupertino.dart';
import 'package:vayu/theme/AppTheme.dart';
import 'package:vayu/theme/SizeConfig.dart';

class SingleLineReportBox extends StatelessWidget{
  final String reportType;
  final String reportData;
  const SingleLineReportBox({super.key, required this.reportType, required this.reportData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0,horizontal: 5.0),
      child: Row(
        children: [
          Text(reportType,style: TextStyle(fontSize: getProportionateScreenHeight(20), color: AppTheme.white, fontWeight: FontWeight.w300 ),),
          SizedBox(width: 10.0,),
          SizedBox(child: Text(reportData, textAlign: TextAlign.justify,style: TextStyle(fontSize: getProportionateScreenHeight(20), color: AppTheme.primaryGreen, fontWeight: FontWeight.w700),)),

        ],
      ),
    );
  }

}
class MultipleLineReportBox extends StatelessWidget{
  final String reportType;
  final String reportData;
  const MultipleLineReportBox({super.key, required this.reportType, required this.reportData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0,horizontal: 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(reportType,style: TextStyle(fontSize: getProportionateScreenHeight(20), color: AppTheme.white, fontWeight: FontWeight.w300 ),),
          SizedBox(height: 10.0,),
          SizedBox(child: Text(reportData, textAlign: TextAlign.justify,style: TextStyle(fontSize: getProportionateScreenHeight(20), color: AppTheme.primaryGreen, fontWeight: FontWeight.w700),)),

        ],
      ),
    );
  }

}