import 'package:appcubook/UI/Home.dart';
import 'package:custom_splash/custom_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Function duringSplash = () {
    return 1;
  };
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MaterialApp(
      home: CustomSplash(
        imagePath: 'assets/LogoBg.png',
        backGroundColor: Colors.white,
        animationEffect: 'zoom-in',
        home: Home(),
        customFunction: duringSplash,
        duration: 3000,
        type: CustomSplashType.StaticDuration,
      ),
    ));
  });
}
