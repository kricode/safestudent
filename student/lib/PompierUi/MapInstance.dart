import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapInstance extends StatefulWidget {
  final GeoPoint point;
  MapInstance({Key key, this.point}) : super(key: key);

  _MapInstanceState createState() => _MapInstanceState();
}

class _MapInstanceState extends State<MapInstance> {
  Set<Marker> _markers = {};
  BitmapDescriptor pinLocationIcon;
  Completer<GoogleMapController> _controller = Completer();
  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/images/pin.png');
  }
    @override
  void initState() {
      super.initState();
      setCustomMapPin();
  }


  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  LatLng point = LatLng(37.43296265331129, -122.08832357078792);

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  final LatLng _center = const LatLng(37.43296265331129, -122.08832357078792);
  @override
  
  @override
  Widget build(BuildContext context) {
 //   GeoPoint geoPoint = widget.point.getGeoPoint("position");

 //      double lat = geoPoint.getLatitude();
 //      double lng = geoPoint.getLongitude();
//LatLng latLng = new LatLng(lat, lng);
    return new Scaffold(
      body: GoogleMap(
        markers: Set.from(_markers),
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          setState(() {
            _markers.add(
                Marker(
                  markerId: MarkerId('Test'),
                  position: _center,
                  icon: pinLocationIcon
                  
                )
            );});
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('Montrer Alerte'),
        icon: Icon(Icons.info_outline),
        backgroundColor: Colors.red,

      ),
    );
  }
 Map<MarkerId, Marker> markers = <MarkerId, Marker>{}; // CLASS MEMBER, MAP OF MARKS


  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}