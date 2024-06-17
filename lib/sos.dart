// lib/sos.dart
import 'package:flutter/material.dart';
import 'package:location/location.dart' as loc;
import 'package:geocoding/geocoding.dart' as geo;

class SosBuzzerPage extends StatefulWidget {
  @override
  _SosBuzzerPageState createState() => _SosBuzzerPageState();
}

class _SosBuzzerPageState extends State<SosBuzzerPage> {
  loc.Location _location = loc.Location(); // Use loc.Location from the location package

  Future<void> _getAndShowLocation() async {
    try {
      loc.LocationData currentLocation = await _location.getLocation(); // Use LocationData from location package
      double lat = currentLocation.latitude!;
      double lng = currentLocation.longitude!;

      List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(lat, lng); // Use geocoding to get placemarks
      geo.Placemark place = placemarks.first;
      _showLocationDialog(place);
    } catch (e) {
      print("Error fetching location: $e");
      _showErrorDialog(e.toString());
    }
  }

  Future<void> _showLocationDialog(geo.Placemark place) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Your Location'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("${place.street}, ${place.locality}, ${place.postalCode}, ${place.country}")
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showErrorDialog(String error) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(error)
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SOS Buzzer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Ink(
              decoration: ShapeDecoration(
                color: Colors.black,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.all_inclusive,
                  color: Colors.blueAccent,
                ),
                iconSize: 150.0,
                splashColor: Colors.redAccent,
                padding: EdgeInsets.all(40.0),
                onPressed: _getAndShowLocation,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25.0),
            ),
            Text(
              "Send Emergency Alert.",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22.2,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}


