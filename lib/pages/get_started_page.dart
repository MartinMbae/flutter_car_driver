import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_car_driver/pages/name_page.dart';
import 'package:flutter_car_driver/pages/phone_page.dart';
import 'package:flutter_car_driver/utils/constants.dart';
import 'package:flutter_car_driver/utils/methods.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class GetStartedPage extends StatelessWidget {

  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(APP_NAME, style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.black87)),
              SizedBox(
                height: 20,
              ),
              Image.asset('assets/images/logo_no_word.png'),
              SizedBox(
                height: 30,
              ),
              Text("Slogan Here", style: Theme.of(context).textTheme.headline5),
              Expanded(
                child: SizedBox(),
              ),

              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: RoundedLoadingButton(
                  child:
                  Text('Get Started', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    _btnController.reset();
                    navigateToPage(context, PhoneNumberPage());
                  }, controller: _btnController,
                  color: textColor,
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
