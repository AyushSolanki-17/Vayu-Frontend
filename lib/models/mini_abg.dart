import 'dart:convert';

import 'package:http/http.dart' as http;

import '../helpers/url_list.dart';
class MiniAbgResponse {
  int? id;
  String? report;
  double? ph;
  double? paco2;
  double? hco3;
  String? disorder;
  String? compensation;
  int? user;

  MiniAbgResponse(
      {this.id,
        this.report,
        this.ph,
        this.paco2,
        this.hco3,
        this.disorder,
        this.compensation,
        this.user});

  MiniAbgResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    report = json['report'];
    ph = json['ph'];
    paco2 = json['paco2'];
    hco3 = json['hco3'];
    disorder = json['disorder'];
    compensation = json['compensation'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['report'] = this.report;
    data['ph'] = this.ph;
    data['paco2'] = this.paco2;
    data['hco3'] = this.hco3;
    data['disorder'] = this.disorder;
    data['compensation'] = this.compensation;
    data['user'] = this.user;
    return data;
  }
}

class MiniAbgRequest {
  double? paco2;
  double? hco3;
  int? user;

  MiniAbgRequest({this.paco2, this.hco3, this.user});

  MiniAbgRequest.fromJson(Map<String, dynamic> json) {
    paco2 = json['paco2'];
    hco3 = json['hco3'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['paco2'] = this.paco2;
    data['hco3'] = this.hco3;
    data['user'] = this.user;
    return data;
  }
}

Future<MiniAbgResponse> miniAbgRequest(MiniAbgRequest abgTestRequest) async {
  //print(abgTestRequest.toJson());
  final response = await http.post(
    Uri.parse(UrlList.abgMiniTestUrl.toString()),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(abgTestRequest.toJson()),
  );
  if (response.statusCode == 200) {
    //print(response.body);
    return MiniAbgResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to submit test');
  }
}