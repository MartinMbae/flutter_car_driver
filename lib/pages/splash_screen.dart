import 'package:flutter/material.dart';
import 'package:flutter_car_driver/pages/onboarding_screen.dart';
import 'package:flutter_car_driver/pages/permission_requred_screen.dart';
import 'package:flutter_car_driver/utils/methods.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      List<Permission> permissions = [
        Permission.location,
        Permission.camera,
        Permission.storage,
      ];

      List<String> permissionsListText = [
        "Access to your Location",
        "Access to your Camera",
        "Access to your Phone Storage"
      ];

      bool allAreGranted = await checkIfAllPermissionsAreGranted(permissions);
      if (allAreGranted) {
        return goToNextPageRemoveHistory(context, OnBoardingPage());
      } else {
        return goToNextPageRemoveHistory(
            context,
            PermissionRequiredPage(
              permissions: permissions,
              permissionsListText: permissionsListText,
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        child: CircularProgressIndicator(),
      ),
    ));
  }
}
