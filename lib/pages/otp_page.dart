import 'dart:async';

import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_car_driver/pages/name_page.dart';
import 'package:flutter_car_driver/utils/constants.dart';
import 'package:flutter_car_driver/utils/methods.dart';
import 'package:flutter_car_driver/widgets/custom_appbar.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class OtpPage extends StatefulWidget {
  final phoneNumber;

  OtpPage({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  GlobalKey<FormState> formKey = new GlobalKey();

  TextEditingController phoneController = new TextEditingController();

  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(title:"Provide OTP", elevation: 1,),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height -
                1.5 * kToolbarHeight,
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text("Enter 6 digits code sent to ${widget.phoneNumber}",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: textColor)),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 200,
                    child: TextFormField(
                      controller: phoneController,
                      maxLength: 6,
                      decoration: InputDecoration(labelText: "Code"),
                      keyboardType: TextInputType.phone,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "Provide the code";
                        } else if (value.trim().length != 6) {
                          return "Code must contain 6 digits";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  ArgonTimerButton(
                    initialTimer: 60,
                    // Optional
                    height: 30,
                    width: MediaQuery.of(context).size.width * 0.6,
                    minWidth: MediaQuery.of(context).size.width * 0.6,
                    color: textColor,
                    borderRadius: 5.0,
                    child: Text(
                      "Resend OTP",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                    ),
                    loader: (timeLeft) {
                      return Text(
                        "Resend Code in | $timeLeft",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w300),
                      );
                    },
                    onTap: (startTimer, btnState) {
                      if (btnState == ButtonState.Idle) {
                        startTimer(60);
                      }
                    },
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: RoundedLoadingButton(
                      child:
                          Text('Next', style: TextStyle(color: Colors.white)),
                      controller: _btnController,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          submitCode(context);
                        } else {
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

  void submitCode(BuildContext buildContext) async {
    Timer(Duration(seconds: 3), () {
      _btnController.reset();
      navigateToPage(buildContext, NamePage());
    });
  }
}
