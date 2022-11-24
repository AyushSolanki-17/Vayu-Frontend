import 'package:vayu/screens/pft_test/pft_test.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vayu/helpers/url_list.dart';

class PftRequest {
  int? smoking;
  int? diabetes;
  double? fev1;
  double? fev1pred;
  double? fvc;
  double? fvcpred;
  double? cat;
  double? mwt2;
  int? user;

  PftRequest(
      { this.smoking,
        this.diabetes,
        this.fev1,
        this.fev1pred,
        this.fvc,
        this.fvcpred,
        this.cat,
        this.mwt2,
        this.user});

  PftRequest.fromJson(Map<String, dynamic> json) {
    smoking = json['smoking'];
    diabetes = json['diabetes'];
    fev1 = json['fev1'];
    fev1pred = json['fev1pred'];
    fvc = json['fvc'];
    fvcpred = json['fvcpred'];
    cat = json['cat'];
    mwt2 = json['mwt2'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['smoking'] = this.smoking;
    data['diabetes'] = this.diabetes;
    data['fev1'] = this.fev1;
    data['fev1pred'] = this.fev1pred;
    data['fvc'] = this.fvc;
    data['fvcpred'] = this.fvcpred;
    data['cat'] = this.cat;
    data['mwt2'] = this.mwt2;
    data['user'] = this.user;
    return data;
  }
}

class PftResponse {
  int? id;
  String? report;
  int? smoking;
  int? diabetes;
  double? fev1;
  double? fev1pred;
  double? fvc;
  double? fvcpred;
  double? cat;
  double? mwt2;
  int? copdLevel;
  int? user;

  PftResponse(
      {this.id,
        this.report,
        this.smoking,
        this.diabetes,
        this.fev1,
        this.fev1pred,
        this.fvc,
        this.fvcpred,
        this.cat,
        this.mwt2,
        this.copdLevel,
        this.user});

  PftResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    report = json['report'];
    smoking = json['smoking'];
    diabetes = json['diabetes'];
    fev1 = json['fev1'];
    fev1pred = json['fev1pred'];
    fvc = json['fvc'];
    fvcpred = json['fvcpred'];
    cat = json['cat'];
    mwt2 = json['mwt2'];
    copdLevel = json['copd_level'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['report'] = this.report;
    data['smoking'] = this.smoking;
    data['diabetes'] = this.diabetes;
    data['fev1'] = this.fev1;
    data['fev1pred'] = this.fev1pred;
    data['fvc'] = this.fvc;
    data['fvcpred'] = this.fvcpred;
    data['cat'] = this.cat;
    data['mwt2'] = this.mwt2;
    data['copd_level'] = this.copdLevel;
    data['user'] = this.user;
    return data;
  }
}


Future<PftResponse> pftRequest(PftRequest pftTestRequest) async {
  final response = await http.post(
    Uri.parse(UrlList.pftTestUrl.toString()),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(pftTestRequest.toJson()),
  );
  if (response.statusCode == 200) {
    return PftResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to submit test');
  }
}