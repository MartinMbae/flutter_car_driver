import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_car_driver/pages/driver_bus_registration_page.dart';
import 'package:flutter_car_driver/pages/pasword_page.dart';
import 'package:flutter_car_driver/utils/constants.dart';
import 'package:flutter_car_driver/utils/methods.dart';
import 'package:flutter_car_driver/widgets/custom_appbar.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';


class NamePage extends StatelessWidget {
  GlobalKey<FormState> formKey = new GlobalKey();
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();

  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(title:"Provide your details", elevation: 1,),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height -  1.5 *  kToolbarHeight,
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text("Provide your name",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: textColor)),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: firstNameController,
                    decoration: InputDecoration(labelText: "First Name"),
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
                    controller: lastNameController,
                    decoration: InputDecoration(labelText: "Last Name"),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "This field is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: SizedBox(),
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
                          _doSomething(context);
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
      ),
    );
  }

  void _doSomething(BuildContext buildContext) async {
    Timer(Duration(seconds: 3), () {
      _btnController.reset();
      navigateToPage(buildContext,DriverBusRegistrationPage());
    });
  }
}
