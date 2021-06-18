import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_car_driver/models/available_bus.dart';
import 'package:flutter_car_driver/pages/bus_layout.dart';
import 'package:flutter_car_driver/utils/constants.dart';
import 'package:flutter_car_driver/utils/methods.dart';
import 'package:flutter_car_driver/widgets/custom_appbar.dart';
import 'package:flutter_car_driver/widgets/rating_row.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BusDetailsPage extends StatefulWidget {


  final AvailableBooking availableBus;

  const BusDetailsPage({Key? key, required this.availableBus}) : super(key: key);

  @override
  _BusDetailsPageState createState() => _BusDetailsPageState();
}

class _BusDetailsPageState extends State<BusDetailsPage> {
  @override
  Widget build(BuildContext context) {

    String heroTag = "imageHero${widget.availableBus.id}";
    return Scaffold(
      appBar: MyAppBar(title: "Bus Details"),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(CupertinoIcons.clock, size: 20, color: textColor,),
                              Text("Journey Start", style: Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 12),),
                              Text("${widget.availableBus.date} at ${widget.availableBus.time}",  style: Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 14)),
                              SizedBox(height: 16,),

                              Icon(CupertinoIcons.location, size: 20, color: textColor,),
                              Text("From - to",  style: Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 12),),
                              Text("${widget.availableBus.from} to ${widget.availableBus.to}", style: Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 14)),
                              SizedBox(height: 16,),

                              Row(
                                children: [
                                  RatingBarIndicator(
                                    rating:widget.availableBus.ratings,
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star,
                                      color: Colors.indigo,
                                    ),
                                    itemCount: 5,
                                    itemSize: 15.0,
                                    direction: Axis.horizontal,
                                  ),
                                  SizedBox(width: 10,),
                                  Text("${widget.availableBus.ratings}")
                                ],
                              ),
                              SizedBox(width: 10,),

                            ],
                          ),
                          Expanded(child: SizedBox()),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: GestureDetector(
                                    child: Hero(
                                      tag: heroTag,
                                      child:ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                          widget.availableBus.company_image,
                                          loadingBuilder: (BuildContext context, Widget child,
                                              ImageChunkEvent? loadingProgress) {
                                            if (loadingProgress == null) return child;
                                            return Center(
                                              child: CircularProgressIndicator(),
                                            );
                                          },
                                          width: 75,
                                          height:60,
                                          fit: BoxFit.cover,
                                          // height: 180,
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                                        return SingleImageScreen(
                                            tag: heroTag,
                                            imageUrl: widget.availableBus.company_image);
                                      }));
                                    }),
                              ),
                              Text(
                                "Ksh. ${format_string.format (widget.availableBus.price)}",
                                style: Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 16),
                              ),
                            ],
                          )
                        ],
                      ),

                      Divider(),

                      Text("About the Bus",style: Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 18)),
                      SizedBox(height: 8,),
                      Text("${widget.availableBus.description}", style: Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 14)),
                      Divider(),

                      Text("Review",style: Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 14)),
                      RichText(text: TextSpan(
                          style: Theme.of(context).textTheme.subtitle2,
                        children: [
                          TextSpan(text: "${widget.availableBus.ratings}", style: TextStyle(fontSize: 24)),
                          TextSpan(text: "/5.0", style: TextStyle(fontSize: 14))
                        ]
                      )),
                    RatingRow(ratings: widget.availableBus.ratings, title: "Punctuality"),
                    RatingRow(ratings:widget.availableBus.ratings, title: "Service and Staff"),
                    RatingRow(ratings:widget.availableBus.ratings, title: "Bus Cleanliness"),
                    RatingRow(ratings:widget.availableBus.ratings, title: "Comfort"),

                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              color: Colors.white38,
              width: double.infinity,
              child: ElevatedButton.icon(onPressed: (){
                navigateToPage(context, BusLayoutPage(availableBus: widget.availableBus));
              }, icon: Icon(Icons.book), label: Text("Proceed to Booking")),
            )
          ],
        ),
      ),
    );
  }
}

class SingleImageScreen extends StatelessWidget {
  final imageUrl, tag;

  const SingleImageScreen({Key? key, @required this.imageUrl, this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height,
          child: Hero(
            tag: tag,
            child: Image.network(
              imageUrl,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}