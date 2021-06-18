import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_car_driver/models/available_bus.dart';
import 'package:flutter_car_driver/utils/constants.dart';
import 'package:flutter_car_driver/utils/methods.dart';
import 'package:flutter_car_driver/widgets/custom_appbar.dart';
import 'package:flutter_car_driver/widgets/half_bus_card.dart';
import 'package:flutter_car_driver/widgets/payments_row.dart';

class PayPage extends StatefulWidget {
  final AvailableBooking availableBus;

  const PayPage({Key? key, required this.availableBus}) : super(key: key);

  @override
  _PayPageState createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
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
      appBar: MyAppBar(title:"Payment", elevation: 1.0,),
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
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PaymentRow(title: "Seats 18", amount: "Ksh. ${widget.availableBus.price}"),
                        SizedBox(height: 10,),
                        PaymentRow(title: "Discount", amount: "Ksh. 0"),
                        SizedBox(height: 10,),
                        PaymentRow(title: "Total".toUpperCase(), amount: "Ksh. ${widget.availableBus.price}"),
                        SizedBox(height: 20,),
                        Text("Mpesa".toUpperCase(), style: TextStyle(fontSize: 20),),
                        SizedBox(height: 10,),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Mpesa Number",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                color: Colors.white38,
                width: double.infinity,
                child: ElevatedButton.icon(onPressed: (){
                }, icon: Icon(Icons.money), label: Text("Pay Now")),
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
