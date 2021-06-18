import 'package:flutter/material.dart';


class OpacityButton extends StatelessWidget {

  final Icon icon;
  final String title;
  final Function callBack;

  const OpacityButton({Key? key, required this.icon,required this.title, required this.callBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: ElevatedButton.icon(onPressed: (){
        callBack();
      }, icon: icon, label: Text(title, style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12),),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white.withOpacity(0.8)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black87),
        ),
      ),
    );
  }
}
