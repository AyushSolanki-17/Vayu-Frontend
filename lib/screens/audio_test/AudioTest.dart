import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vayu/helpers/url_list.dart';
import 'package:vayu/theme/AppTheme.dart';
import 'package:vayu/theme/SizeConfig.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AudioTestUploadScreen extends StatefulWidget {
  const AudioTestUploadScreen({super.key});

  @override
  State<AudioTestUploadScreen> createState() => _AudioTestUploadScreenState();
}

class _AudioTestUploadScreenState extends State<AudioTestUploadScreen> {
  File? audio;
  var report = null;
  bool showProcessing = false;

  void uploadAudio(filename) async {

    var request = http.MultipartRequest('POST', Uri.parse(UrlList.audioTestUrl));
    request.files.add(await http.MultipartFile.fromPath('audio', filename));
    request.fields["user"] = 5.toString();
    var res = await request.send();

    res.stream.transform(utf8.decoder).listen((value) {
      setState(() {
        report = jsonDecode(value);
        showProcessing = false;
      });
      print(report);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    File file;
    return Scaffold(
      backgroundColor: AppTheme.screenBgWhite,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(50),
              horizontal: getProportionateScreenWidth(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: AppTheme.primaryGreen,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(15),
                      horizontal: getProportionateScreenWidth(5)),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_back_ios_new_sharp)),
                      Expanded(
                          child: Center(
                              child: Text(
                                'Upload Audio',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppTheme.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: getProportionateScreenHeight(35)),
                              ))),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(100),
              ),
              Text(
                'Please upload a sthethescope audio file',
                style: TextStyle(color: AppTheme.blackBgBtn, fontSize: 16),
              ),
              SizedBox(
                height: getProportionateScreenHeight(25),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryGreen,
                  ),
                  onPressed: () async {
                    setState(() {
                      showProcessing = true;
                    });
                    FilePickerResult? result = await FilePicker.platform.pickFiles();

                    if (result != null) {
                      file = File(result.files.single.path!);
                      uploadAudio(file.path.toString());
                    }
                  },
                  child: const Text("Upload AudioFile")),
              SizedBox(
                height: getProportionateScreenHeight(100),
              ),
              SizedBox(
                height: getProportionateScreenHeight(100),
              ),
              showProcessing
                  ? const CircularProgressIndicator()
                  : SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              if (report!=null)
                Text(
                  report["result"],
                  style: TextStyle(
                      fontSize: getProportionateScreenHeight(35),
                      color: AppTheme.primaryGreen),
                )
              else
                const SizedBox(
                  height: 2.0,
                )
            ],
          ),
        ),
      ),
    );
  }

}
