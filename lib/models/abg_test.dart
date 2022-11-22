import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vayu/helpers/url_list.dart';

class AbgTestRequest {
  double? ph;
  double? paco2;
  double? pao2;
  double? o2sat;
  double? hco3;
  double? na;
  double? cl;
  int? user;

  AbgTestRequest(
      {this.ph,
        this.paco2,
        this.pao2,
        this.o2sat,
        this.hco3,
        this.na,
        this.cl,
        this.user});

  AbgTestRequest.fromJson(Map<String, dynamic> json) {
    ph = json['ph'];
    paco2 = json['paco2'];
    pao2 = json['pao2'];
    o2sat = json['o2sat'];
    hco3 = json['hco3'];
    na = json['na'];
    cl = json['cl'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ph'] = ph;
    data['paco2'] = paco2;
    data['pao2'] = pao2;
    data['o2sat'] = o2sat;
    data['hco3'] = hco3;
    data['na'] = na;
    data['cl'] = cl;
    data['user'] = user;
    return data;
  }
}

class AbgTestResponse {
  int? id;
  String? report;
  double? ph;
  double? paco2;
  double? pao2;
  double? o2sat;
  double? hco3;
  double? na;
  double? cl;
  String? disorder;
  bool? isMetabolicAcidosis;
  String? compensation;
  double? anionGap;
  double? deltaRatio;
  String? anionGapResult;
  String? deltaRatioResult;
  int? user;

  AbgTestResponse(
      {this.id,
        this.report,
        this.ph,
        this.paco2,
        this.pao2,
        this.o2sat,
        this.hco3,
        this.na,
        this.cl,
        this.disorder,
        this.isMetabolicAcidosis,
        this.compensation,
        this.anionGap,
        this.deltaRatio,
        this.anionGapResult,
        this.deltaRatioResult,
        this.user});

  AbgTestResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    report = json['report'];
    ph = json['ph'];
    paco2 = json['paco2'];
    pao2 = json['pao2'];
    o2sat = json['o2sat'];
    hco3 = json['hco3'];
    na = json['na'];
    cl = json['cl'];
    disorder = json['disorder'];
    isMetabolicAcidosis = json['is_metabolic_acidosis'];
    compensation = json['compensation'];
    anionGap = json['anion_gap'];
    deltaRatio = json['delta_ratio'];
    anionGapResult = json['anion_gap_result'];
    deltaRatioResult = json['delta_ratio_result'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['report'] = report;
    data['ph'] = ph;
    data['paco2'] = paco2;
    data['pao2'] = pao2;
    data['o2sat'] = o2sat;
    data['hco3'] = hco3;
    data['na'] = na;
    data['cl'] = cl;
    data['disorder'] = disorder;
    data['is_metabolic_acidosis'] = isMetabolicAcidosis;
    data['compensation'] = compensation;
    data['anion_gap'] = anionGap;
    data['delta_ratio'] = deltaRatio;
    data['anion_gap_result'] = anionGapResult;
    data['delta_ratio_result'] = deltaRatioResult;
    data['user'] = user;
    return data;
  }
}

Future<AbgTestResponse> abgRequest(AbgTestRequest abgTestRequest) async {
  final response = await http.post(
    Uri.parse(UrlList.abgTestUrl.toString()),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(abgTestRequest.toJson()),
  );
  if (response.statusCode == 200) {
    return AbgTestResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to submit test');
  }
}