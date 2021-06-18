import 'package:flutter/material.dart';
import 'package:flutter_car_driver/map/page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class PlaceMarkerPage extends GoogleMapExampleAppPage {
  PlaceMarkerPage() : super(const Icon(Icons.place), 'Place marker');

  @override
  Widget build(BuildContext context) {
    return const PlaceMarkerBody();
  }
}

class PlaceMarkerBody extends StatefulWidget {
  const PlaceMarkerBody();

  @override
  State<StatefulWidget> createState() => PlaceMarkerBodyState();
}

typedef Marker MarkerUpdateAction(Marker marker);

class PlaceMarkerBodyState extends State<PlaceMarkerBody> {
  PlaceMarkerBodyState();
  static final LatLng center = const LatLng(1.2921, 36.8219);

  GoogleMapController? controller;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  MarkerId? selectedMarker;
  int _markerIdCounter = 1;

  void _onMapCreated(GoogleMapController controller) {
    this.controller = controller;
  }

  @override
  void dispose() {
    super.dispose();
  }


  void _add( double lat, double long) {
    final int markerCount = markers.length;

    if (markerCount == 12) {
      return;
    }

    final String markerIdVal = 'marker_id_$_markerIdCounter';
    _markerIdCounter++;
    final MarkerId markerId = MarkerId(markerIdVal);

    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(
        lat,
        long,
      ),
      infoWindow: InfoWindow(title: markerIdVal, snippet: '*'),
    );

    setState(() {
      markers[markerId] = marker;
    });
  }


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _add(1.2921,36.8219);
      _add(2.890,37.8219);
    });
  }

  @override
  Widget build(BuildContext context) {

    LatLng izp = LatLng(-3.386943, 29.371636);

    return Scaffold(
      body: Center(
        child:
        GoogleMap(
          initialCameraPosition: CameraPosition(target: izp, zoom: 10.0),
          compassEnabled: true,
          scrollGesturesEnabled: true,
          zoomGesturesEnabled: true,
          onMapCreated:  _onMapCreated,
          markers: Set<Marker>.of(markers.values),
          polylines: {},//initialize the polylines list
        ),
        // GoogleMap(
        //   onMapCreated: _onMapCreated,
        //   initialCameraPosition: const CameraPosition(
        //     target: LatLng(1.2921, 36.8219),
        //     zoom: 8.0,
        //   ),
        //   markers: Set<Marker>.of(markers.values),
        // ),
      ),
    );
  }
}
