import 'package:flutter/material.dart';
import 'package:flutter_car_driver/utils/constants.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  
  final String title;
  final double elevation;

  final List<Widget>? actions;

  const MyAppBar({Key? key, required this.title, this.elevation = 0, this.actions}) : super(key: key);
    
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style:Theme.of(context).textTheme.subtitle1!.copyWith(color: textColor, fontSize: 18),),
      backgroundColor: Colors.white,
      elevation: elevation,
      iconTheme: IconThemeData(color: textColor),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
