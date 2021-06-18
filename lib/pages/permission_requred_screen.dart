import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_car_driver/pages/onboarding_screen.dart';
import 'package:flutter_car_driver/utils/constants.dart';
import 'package:flutter_car_driver/utils/methods.dart';
import 'package:flutter_car_driver/widgets/custom_appbar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class PermissionRequiredPage extends StatefulWidget {
  final List<Permission> permissions;
  final List<String> permissionsListText;

  const PermissionRequiredPage(
      {Key? key, required this.permissions, required this.permissionsListText})
      : super(key: key);

  @override
  _PermissionRequiredPageState createState() => _PermissionRequiredPageState();
}
 
class _PermissionRequiredPageState extends State<PermissionRequiredPage> {
  final RoundedLoadingButtonController _btnController =  RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Permission Required",
        elevation: 1,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/logo_no_word.png',
              height: 100,
              width: 100,
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "For proper functioning, $APP_NAME requires access to the following permissions;",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 15,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: widget.permissionsListText.length,
                itemBuilder: (context, index) {
                  return Text(
                      "${index + 1}.  ${widget.permissionsListText[index]}",
                      style: TextStyle(fontSize: 14));
                }),
            Expanded(child: SizedBox()),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: RoundedLoadingButton(
                child: Text('Grant Permission',
                    style: TextStyle(color: Colors.white)),
                controller: _btnController,
                onPressed: () {
                  requestPermissions(context);
                },
                color: textColor,
              ),
            ),
            SizedBox(height: 12,),
          ],
        ),
      ),
    );
  }

  void requestPermissions(BuildContext buildContext) async {
    Timer(Duration(seconds: 1), () async {
      _btnController.reset();
      await widget.permissions.request();
      bool allAreGranted = await checkIfAllPermissionsAreGranted(widget.permissions);
      if (allAreGranted) {
        return goToNextPageRemoveHistory(context, OnBoardingPage());
      }else{
        Fluttertoast.showToast(msg: "You must first grant access to the necessary permissions", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
        bool somePermissionIsPermanentlyDenied = await checkIfAnyPermissionIsPermanentlyDenied(widget.permissions);
        if(somePermissionIsPermanentlyDenied){
          openAppSettings();
        }
      }
    });
  }
}
