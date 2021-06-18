import 'package:flutter/material.dart';

class PickUpStation extends StatelessWidget {

  final String? stationName;

  const PickUpStation({Key? key, required this.stationName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Text("$stationName"),
          SizedBox(height: 4,),
        ],
      ),
    );
  }
}
