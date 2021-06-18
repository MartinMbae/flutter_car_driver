import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_car_driver/pages/splash_screen.dart';
import 'package:flutter_car_driver/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) {
    HttpOverrides.global = new MyHttpOverrides();
    runApp(MyApp());
  });
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
      ((X509Certificate cert, String host, int port) {
        // final isValidHost =
        // [BASE_URL].contains(host); // <-- allow only hosts in array
        return true;
      });
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ).apply(bodyColor: textColor),
        // primaryColor: Color(0xFF1D125D),
        // primaryColorDark: Color(0xFF150D45),
        primarySwatch: Colors.indigo
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

