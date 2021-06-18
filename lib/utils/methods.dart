import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

final format_string = new NumberFormat("#,##0", "en_US");

Future goToNextPageRemoveHistory(BuildContext context, Widget newRoute) async {
  return await Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => newRoute), (route) => false);
}

Future navigateToPage(context, page) async {
  await Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

Future<bool> checkIfAllPermissionsAreGranted(List<Permission> permissions) async {
  bool allAreGranted = true;
  for (Permission permission in permissions) {
    bool isDenied = await permission.status.isDenied;
    if (isDenied) {
      allAreGranted = false;
      continue;
    }
  }

  return allAreGranted;
}
Future<bool> checkIfAnyPermissionIsPermanentlyDenied(List<Permission> permissions) async {
  bool somePermissionIsPermanentlyDenied = false;
  for (Permission permission in permissions) {
    PermissionStatus permissionStatus = await permission.status;
    if(!permissionStatus.isGranted){
      bool isPermanently = permissionStatus.isDenied;
      if ( isPermanently) {
        somePermissionIsPermanentlyDenied = true;
        continue;
      }
    }
  }
  return somePermissionIsPermanentlyDenied;
}
