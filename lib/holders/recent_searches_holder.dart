import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_car_driver/map/place_marker.dart';
import 'package:flutter_car_driver/models/recent_searches.dart';
import 'package:flutter_car_driver/utils/methods.dart';
import 'package:flutter_car_driver/widgets/pickup_station.dart';
import 'package:fw_ticket/fw_ticket.dart';

class RecentSearchHolder extends StatelessWidget {

  final RecentSearch recentSearch;

  const RecentSearchHolder({Key? key, required this.recentSearch}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    String heroTag = "imageHero${recentSearch.id}";
    return Container(
      width: 375,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 30.0,),
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
                        child: Hero(
                          tag: heroTag,
                          child:ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              recentSearch.company_image,
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
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) {
                            return SingleImageScreen(
                                tag: heroTag,
                                imageUrl: recentSearch.company_image);
                          }));
                        }),
                  ),
                  Expanded(child: SizedBox()),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(recentSearch.bus_company),
                        Text("${recentSearch.from} to ${recentSearch.to}"),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Pick 6 on the way",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ],
                    ),
                  ),
                  Divider(height: 0.0),
                  SizedBox(height: 8,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text("Pick Up Stations", style: TextStyle(fontSize: 16,decoration: TextDecoration.underline),),
                  ),
                  SizedBox(height: 4,),
                  PickUpStation(stationName: "Stage Corner 1"),
                  PickUpStation(stationName: "Stage Corner 3"),
                  PickUpStation(stationName: "Stage Corner 5"),
                  PickUpStation(stationName: "Stage Corner 7"),
                  GestureDetector(
                    onTap: (){
                      navigateToPage(context, PlaceMarkerPage());
                    },
                    child: Container(
                      width: double.infinity,
                      color: Colors.indigo,
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Center(
                        child: Text(
                          'More Info',
                          style:
                          TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
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