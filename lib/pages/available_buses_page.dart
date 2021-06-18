import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_car_driver/holders/available_bookings_holder.dart';
import 'package:flutter_car_driver/models/available_bus.dart';
import 'package:flutter_car_driver/widgets/custom_appbar.dart';

class AvailableBusesPage extends StatefulWidget {
  @override
  _AvailableBusesState createState() => _AvailableBusesState();
}

class _AvailableBusesState extends State<AvailableBusesPage> {

  List<AvailableBooking> availableBusesList = availableBookingList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: MyAppBar(title: "Search Results"),
      body: Container(
        color: Colors.grey[300],
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: 24),
          itemCount: availableBusesList.length,
          itemBuilder: (context, index){
            return AvailableBusHolder(
              availableBus: availableBusesList[index],
            );
          },
          shrinkWrap: true,
        ),
      ),

    );
  }
}
