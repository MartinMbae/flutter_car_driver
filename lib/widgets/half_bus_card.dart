import 'package:flutter/material.dart';
import 'package:flutter_car_driver/models/available_bus.dart';
import 'package:flutter_car_driver/utils/methods.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fw_ticket/fw_ticket.dart';


class HalfBusCard extends StatelessWidget {

  final AvailableBooking availableBus;

  const HalfBusCard({Key? key, required this.availableBus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 375,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 10.0,),
          Ticket(
            dashedBottom: true,
            innerRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0)
            ),
            outerRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4.0),
                blurRadius: 2.0,
                spreadRadius: 2.0,
                color: Color.fromRGBO(196, 196, 196, .76),
              )
            ],
            child: Container(
              color: Colors.white,
              width: 300,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GestureDetector(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          availableBus.company_image,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          width: 100,
                          height:80,
                          fit: BoxFit.cover,
                          // height: 180,
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(availableBus.bus_company),
                        Text("${availableBus.from} to ${availableBus.to}"),
                        Row(
                          children: [
                            RatingBarIndicator(
                              rating:availableBus.ratings,
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Colors.indigo,
                              ),
                              itemCount: 5,
                              itemSize: 15.0,
                              direction: Axis.horizontal,
                            ),
                            SizedBox(width: 10,),
                            Text("${availableBus.ratings}")
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Ticket(
            dashedBottom: true,
            innerRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0)
            ),
            outerRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 2.0,
                spreadRadius: 2.0,
                color: Color.fromRGBO(196, 196, 196, .76),
              )
            ],
            child: Container(
              color: Colors.white,
              width: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Date'),
                              FittedBox(
                                child: Text(
                                  availableBus.date,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Time'),
                                FittedBox(
                                  child: Text(
                                    availableBus.time,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.0),
                                  ),
                                )
                              ],
                            ),
                          )),
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Price'),
                                FittedBox(
                                  child: Text(
                                    "Ksh. ${format_string.format (availableBus.price)}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.0),
                                  ),
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
