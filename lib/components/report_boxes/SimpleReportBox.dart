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
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.symmetric(vertical: 15.0,horizontal: 5.0),
      decoration: const BoxDecoration(
        color: AppTheme.blackBgBtnLight,
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Row(
        children: [
          SizedBox(child: Text(reportType,style: TextStyle(fontSize: getProportionateScreenHeight(20), color: AppTheme.white, fontWeight: FontWeight.w300 ),)),

          SizedBox(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: Text(reportData, textAlign: TextAlign.justify,style: TextStyle(fontSize: getProportionateScreenHeight(20), color: AppTheme.primaryGreen, fontWeight: FontWeight.w700),),
          )),

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
      padding: EdgeInsets.all(15.0),
      decoration: const BoxDecoration(
        color: AppTheme.blackBgBtnLight,
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      margin: EdgeInsets.symmetric(vertical: 15.0,horizontal: 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(reportType,style: TextStyle(fontSize: getProportionateScreenHeight(20), color: AppTheme.white, fontWeight: FontWeight.w300 ),),
          SizedBox(height: 10.0,),
          SizedBox(child: Text(reportData, textAlign: TextAlign.justify,style: TextStyle(fontSize: getProportionateScreenHeight(15), color: AppTheme.primaryGreen, fontWeight: FontWeight.w700),)),

        ],
      ),
    );
  }

}