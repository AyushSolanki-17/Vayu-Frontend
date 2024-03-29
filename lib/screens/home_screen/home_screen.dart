import 'package:flutter/material.dart';
import 'package:vayu/components/buttons/IconTextMenuButton.dart';
import 'package:vayu/screens/abg_test/abg_test.dart';
import 'package:vayu/screens/kommunicate_chatbot/chatbot.dart';
import 'package:vayu/screens/mini_abg/mini_abg_test.dart';
import 'package:vayu/screens/pft_test/pft_test.dart';
import 'package:vayu/screens/xray_test/xray_upload.dart';
import 'package:vayu/theme/AppTheme.dart';
import 'package:vayu/theme/SizeConfig.dart';

import '../audio_test/AudioTest.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppTheme.screenBgWhite,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image(
              image: const AssetImage('assets/homebg.png'),
              width: (MediaQuery.of(context).size.width),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(25),
                  horizontal: getProportionateScreenWidth(25)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 60),
                            child: Container(
                                decoration: const BoxDecoration(
                                    color: AppTheme.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                      "assets/icons/notification.png"),
                                  iconSize: 45,
                                )),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: Text(
                          "Welcome",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: getProportionateScreenHeight(25),
                              color: AppTheme.blackBgBtn),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Text(
                          "Ayush",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: getProportionateScreenHeight(35),
                              color: AppTheme.white),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(100),
                  ),
                  Row(
                    children: [
                      Text(
                        "Explore",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: getProportionateScreenHeight(25),
                            color: AppTheme.blackBgBtn),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        "VAYU",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: getProportionateScreenHeight(25),
                            color: AppTheme.primaryGreen),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(15),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: AppTheme.grayBorder),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    margin: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(2),
                        horizontal: getProportionateScreenWidth(2)),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: getProportionateScreenHeight(25.0),
                              horizontal: getProportionateScreenWidth(15.0)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconTextMenuButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const AbgTest()));
                                  },
                                  icon: Image.asset("assets/icons/health.png"),
                                  buttonText: "Disorder Diagnosis"),
                              IconTextMenuButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const XRayUploadScreen()));
                                  },
                                  icon: Image.asset("assets/icons/xray.png"),
                                  buttonText: "X-Ray Check"),
                              IconTextMenuButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                WebViewApp()));
                                  },
                                  icon: Image.asset("assets/icons/android.png"),
                                  buttonText: "Health Bot")
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: getProportionateScreenHeight(25.0),
                              horizontal: getProportionateScreenWidth(15.0)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconTextMenuButton(onPressed: (){Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const MiniAbgTest()));},
                                  icon: Image.asset("assets/icons/clipboardtext.png"),
                                  buttonText: "ABG"),
                              IconTextMenuButton(onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (contest)=> const AudioTestUploadScreen() ));
                              },
                                  icon: Image.asset("assets/icons/useroctagon.png"),
                                  buttonText: "Audio"),
                              IconTextMenuButton(onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (contest)=> const PftTest() ));
                              },
                                  icon: Image.asset("assets/icons/clipboardtext.png"),
                                  buttonText: "PFT"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(25),
                  ),
                  Text(
                    "COPD INFO",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: getProportionateScreenHeight(25),
                        color: AppTheme.blackBgBtn),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(25),
                  ),
                  Image(
                    image: const AssetImage('assets/awareness1.jpg'),
                    width: (MediaQuery.of(context).size.width),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
