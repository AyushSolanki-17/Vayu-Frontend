import 'dart:convert';
import 'dart:io';

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

class XRayUploadScreen extends StatefulWidget{
  const XRayUploadScreen({super.key});

  @override
  State<XRayUploadScreen> createState() => _XRayUploadScreenState();
}

class _XRayUploadScreenState extends State<XRayUploadScreen> {

  File? image;
  String report = '';

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = File(img!.path);

    });
  }

  upload(File imageFile) async {
    // open a bytestream
    var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();

    // string to uri
    var uri = Uri.parse(UrlList.xrayTestUrl);

    // create multipart request
    var request = http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = http.MultipartFile('xray', stream, length,
        filename: basename(imageFile.path));

    // add file to multipart
    request.files.add(multipartFile);
    request.fields['user']=5.toString();
    // send
    var response = await request.send();

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {

      setState(() {
        report = jsonDecode(value)["result"];
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppTheme.screenBgBlack,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(50), horizontal: getProportionateScreenWidth(15)),
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
                  padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(15), horizontal: getProportionateScreenWidth(5)),
                  child: Row(
                    children: [
                      IconButton(onPressed: (){Navigator.of(context).pop();}, icon: const Icon(Icons.arrow_back_ios_new_sharp)),
                      Expanded(child: Center(child: Text('X-Ray Test', textAlign: TextAlign.center, style: TextStyle(color: AppTheme.white, fontWeight: FontWeight.w800, fontSize: getProportionateScreenHeight(35)),))),
                    ],
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(100),),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryGreen,
                ),
                  onPressed: () async{
                await getImage(ImageSource.gallery);
                upload(image!);
              }, child: const Text("Upload X-RAY")),
              SizedBox(height: getProportionateScreenHeight(100),),
              image != null
                  ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    //to show image, you type like this.
                    File(image!.path),
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                  ),
                ),
              )
                  : const Text(
                "No Image",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: getProportionateScreenHeight(100),),
              if (report != '')
                  Text(report.toString(),style: TextStyle(fontSize: getProportionateScreenHeight(15), color: AppTheme.primaryGreen),)
              else
                const SizedBox(height: 2.0,)
            ],
          ),
        ),
      ),
    );
  }
}