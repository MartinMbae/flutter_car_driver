import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_car_driver/fragments/home_fragment.dart';
import 'package:flutter_car_driver/fragments/request_auth_fragment.dart';
import 'package:flutter_car_driver/utils/constants.dart';
import 'package:flutter_car_driver/widgets/custom_appbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  Widget getPageToDisplay() {
    switch (_selectedIndex) {
      case 0:
        return HomeFragment();

      case 1:
        return AuthRequestPage();

      default:
        return AuthRequestPage();
    }
  }

  bool _isOn = true;

  void toggle() {
    setState(() => _isOn = !_isOn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Home",
        elevation: 1.0,
      ),
      body: getPageToDisplay(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: textColor,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_balance_wallet_rounded,
                color: textColor,
              ),
              label: 'Wallet'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.history,
                color: textColor,
              ),
              label: 'My Trips'),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
