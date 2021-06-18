import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_car_driver/models/available_bus.dart';
import 'package:flutter_car_driver/pages/payment_page.dart';
import 'package:flutter_car_driver/utils/constants.dart';
import 'package:flutter_car_driver/utils/methods.dart';
import 'package:flutter_car_driver/widgets/custom_appbar.dart';
import 'package:flutter_car_driver/widgets/half_bus_card.dart';

class BusLayoutPage extends StatefulWidget {
  final AvailableBooking availableBus;

  const BusLayoutPage({Key? key, required this.availableBus}) : super(key: key);

  @override
  _BusLayoutPageState createState() => _BusLayoutPageState();
}

class _BusLayoutPageState extends State<BusLayoutPage> {
  bool showSpace = false;

  late int columnsCount;
  late int rowCount;
  late int totalGridItems;

late  int seatNumber;

  int selectedGrid = -1;

  late List<String> bookedSeats;

  @override
  void initState() {
    columnsCount = widget.availableBus.left_seats +
        widget.availableBus.space_seats +
        widget.availableBus.right_seats;

    rowCount = widget.availableBus.seat_rows;
    totalGridItems = columnsCount * rowCount;
    bookedSeats = widget.availableBus.bookedSeats.split(",");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    seatNumber = 0;
    return Scaffold(
      appBar: MyAppBar(title:"Book a seat", elevation: 1.0,),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[200],
          child: Column(
            children: [
              SizedBox(height: 10,),
              HalfBusCard(availableBus: widget.availableBus),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                child: Card(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/bus/occupied.png',
                                  width: 40,
                                  height: 40,
                                ),
                                Text(
                                  "Booked",
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(color: textColor),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/bus/unoccupied.png',
                                  width: 40,
                                  height: 40,
                                ),
                                Text(
                                  "Available",
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(color: textColor),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/bus/selected.png',
                                  width: 40,
                                  height: 40,
                                ),
                                Text(
                                  "Selected",
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(color: textColor),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Image.asset(
                              'assets/images/bus/steering_wheel.png',
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: GridView.count(
                          childAspectRatio: 0.8,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 6,
                          children: [
                            for (int i = 1; i <= totalGridItems; i++)
                              displayElement(i)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 4,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                color: Colors.white38,
                width: double.infinity,
                child: ElevatedButton.icon(onPressed: (){
                  navigateToPage(context, PayPage(availableBus: widget.availableBus));
                }, icon: Icon(Icons.book), label: Text("Proceed")),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget displayElement(int index) {
    int position = index % columnsCount;
    if (position == 0) position = columnsCount;

    // int currentRow = ((index - 1) / columnsCount).floor() + 1;

    if (index >= totalGridItems - columnsCount) {
      //Don't add space at last seat
      showSpace = false;
      seatNumber++;
    } else {
      if (position <= widget.availableBus.left_seats) {
        showSpace = false;
        seatNumber++;
      } else if (position <=
          widget.availableBus.left_seats + widget.availableBus.space_seats) {
        showSpace = true;
      } else {
        showSpace = false;
        seatNumber++;
      }
    }

    int innerSeatNumber = seatNumber;

    if (showSpace) {
      return SizedBox();
    } else {
      return Container(
        height: 100,
        child: Column(
          children: [
            GestureDetector(
              child: GridTile(
                child: new Center(
                  child: Image.asset(
                    bookedSeats.contains("$seatNumber")
                        ? 'assets/images/bus/occupied.png'
                        : (selectedGrid == innerSeatNumber ? 'assets/images/bus/selected.png' : 'assets/images/bus/unoccupied.png'),
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
              onTap: (){
                if(!bookedSeats.contains("$innerSeatNumber")){
                  setState(() {
                    selectedGrid = innerSeatNumber;
                  });
                }
              },
            ),
            Text(" $seatNumber",
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: textColor)),
          ],
        ),
      );
    }
  }
}
