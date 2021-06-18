import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_car_driver/holders/available_bookings_holder.dart';
import 'package:flutter_car_driver/holders/recent_searches_holder.dart';
import 'package:flutter_car_driver/models/available_bus.dart';
import 'package:flutter_car_driver/models/recent_searches.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HomeFragment extends StatefulWidget {
  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {

  List<AvailableBooking> availableBusesList = availableBookingList;

  List<RecentSearch> recentSearches = recentSearchLists;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 40),
      child: Container(
        child: Column(
            children:[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Toggle Availability"),
                    ToggleSwitch(
                      minWidth: 90.0,
                      cornerRadius: 20.0,
                      fontSize: 14,
                      activeBgColors: [[Colors.indigo], [Colors.red[800]!]],
                      activeFgColor: Colors.white,
                      inactiveBgColor: Colors.grey,
                      inactiveFgColor: Colors.white,
                      initialLabelIndex: 0,
                      totalSwitches: 2,
                      labels: ['Available', 'Unavailable'],
                      radiusStyle: true,
                      onToggle: (index) {
                        print('switched to: $index');
                      },
                    ),
                  ],
                ),
              ),
              Divider(),
              SizedBox(height: 4,),
              Text("Ongoing Journey", style: Theme.of(context).textTheme.subtitle1!.copyWith(decoration: TextDecoration.underline, fontSize: 20),),
              Container(
                child: ListView.builder(
                  itemCount: recentSearches.length,
                  itemBuilder: (context, index){
                    return RecentSearchHolder(
                      recentSearch: recentSearches[index],
                    );
                  },
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                ),
              ),
              SizedBox(height: 20,),
              Divider(),
              Text("Upcoming Journeys", style: Theme.of(context).textTheme.subtitle1!.copyWith(decoration: TextDecoration.underline, fontSize: 20),),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(bottom: 24),
                itemCount: availableBusesList.length,
                itemBuilder: (context, index){
                  return AvailableBusHolder(
                    availableBus: availableBusesList[index],
                  );
                },
                shrinkWrap: true,
              ),
            ]
        ),
      ),
    );
  }
}
