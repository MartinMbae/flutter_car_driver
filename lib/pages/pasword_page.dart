import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_car_driver/pages/homepage.dart';
import 'package:flutter_car_driver/utils/constants.dart';
import 'package:flutter_car_driver/utils/methods.dart';
import 'package:flutter_car_driver/widgets/custom_appbar.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';


class PasswordPage extends StatelessWidget {
  GlobalKey<FormState> formKey = new GlobalKey();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();

  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(title:"Create a password", elevation: 1,),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - (1.5 * kToolbarHeight),
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
                  Text("Create a new Password",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: textColor)),

                  SizedBox(
                    height: 5,
                  ),
                  Text("(You will use this password to login later.)",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: textColor, fontSize: 12)),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(labelText: "Password"),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "This field is required";
                      }else if(value.trim().length < 8){
                        return "Password must contain at least 8 characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: confirmPasswordController,
                    decoration: InputDecoration(labelText: "Confirm New Password"),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "This field is required";
                      }else{
                        String password = passwordController.text.trim();
                        if(password != value.trim()){
                          return "Passwords failed to match";
                        }
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
                      child: Text('Create Account',
                          style: TextStyle(color: Colors.white)),
                      controller: _btnController,
                      onPressed: (){
                        if (formKey.currentState!.validate()) {
                          createAccount(context);
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

  void createAccount(BuildContext buildContext) async {
    Timer(Duration(seconds: 3), () {
      _btnController.reset();
      goToNextPageRemoveHistory(buildContext, HomePage());
    });
  }
}
