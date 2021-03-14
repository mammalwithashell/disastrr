import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class Event extends StatefulWidget {
  @override
  _EventState createState() => _EventState();
}

class _EventState extends State<Event> {
  @override
  Widget build(BuildContext context) {
    var pos = _determinePosition().toString();
    return Container(
      child: Text(
        pos,
      ),
    );
  }

  double latitude(Position sample) {
    double lat = sample.latitude;
    return lat;
  }

  double longtitude(Position sample) {
    double lat = sample.longitude;
    return lat;
  }

  Future<List<double>> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    final location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    double lat = location.latitude;
    double long = location.longitude;
    print(lat);
    print(long);

    return [lat, long];
  }
}
