import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_car_driver/pages/pasword_page.dart';
import 'package:flutter_car_driver/utils/constants.dart';
import 'package:flutter_car_driver/utils/methods.dart';
import 'package:flutter_car_driver/widgets/custom_appbar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker_widget/enum/image_picker_widget_shape.dart';
import 'package:image_picker_widget/image_picker_widget.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';


class DriverBusRegistrationPage extends StatefulWidget {
  @override
  _DriverBusRegistrationPageState createState() => _DriverBusRegistrationPageState();
}

class _DriverBusRegistrationPageState extends State<DriverBusRegistrationPage> {
  GlobalKey<FormState> formKey = new GlobalKey();

  TextEditingController vehicleBrandController = new TextEditingController();
  TextEditingController vehicleTypeController = new TextEditingController();
  TextEditingController vehicleNumberController = new TextEditingController();
  TextEditingController vehicleLicenceNumberController = new TextEditingController();

  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();

  File? driverLicence;

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(title:"Vehicle Detail", elevation: 1,),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text("Provide your vehicle info.",
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: textColor)),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: vehicleBrandController,
                  decoration: InputDecoration(labelText: "Vehicle Brand"),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "This field is required";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: vehicleTypeController,
                  decoration: InputDecoration(labelText: "Vehicle Type"),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "This field is required";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: vehicleNumberController,
                  decoration: InputDecoration(labelText: "Vehicle Number"),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "This field is required";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: vehicleLicenceNumberController,
                  decoration: InputDecoration(labelText: "Driver Licence Number",),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "This field is required";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Upload Driver Licence"),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: double.infinity,
                  color: Colors.grey,
                  child: Center(
                    child: ImagePickerWidget(
                      diameter: 180,
                      initialImage: "https://icons-for-free.com/iconfiles/png/512/photo+size+select+actual+24px-131985228158210223.png",
                      shape: ImagePickerWidgetShape.square, // ImagePickerWidgetShape.square
                      isEditable: true,
                      modalCameraText: Text("Camera"),
                      modalGalleryText: Text("Gallery"),
                      onChange: (File file) {
                        driverLicence = file;
                        print("I changed the file to: ${file.path}");
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: RoundedLoadingButton(
                    child: Text('Next',
                        style: TextStyle(color: Colors.white)),
                    controller: _btnController,
                    onPressed: (){
                      if (formKey.currentState!.validate()) {
                        if(driverLicence == null){
                          _btnController.reset();
                          Fluttertoast.showToast(msg: "Please upload driver licence first", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
                        }else{
                          _doSomething(context);
                        }
                      }else{
                        _btnController.reset();
                      }
                    },
                    color: textColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _doSomething(BuildContext buildContext) async {
    Timer(Duration(seconds: 3), () {
      _btnController.reset();
      navigateToPage(buildContext,PasswordPage());
    });
  }
}
