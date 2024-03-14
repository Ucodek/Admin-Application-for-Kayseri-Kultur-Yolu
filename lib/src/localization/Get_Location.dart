import 'package:deneme_1/src/Pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/*
const LatLng currentLocation = LatLng(38.734802, 35.467987);

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _selectedLocation;
  List<Marker> MarkerList = [];
  late GoogleMapController _controller;

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  _handleTapp(LatLng tappedPoint) {
    setState(() {
      if (_selectedLocation != null) {
        _selectedLocation = null;
      }
      _selectedLocation = tappedPoint;
    });
    print(
        'Selected location: ${_selectedLocation?.latitude}, ${_selectedLocation?.longitude}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Select Location'),
        ),
        body: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: currentLocation, // Default location (San Francisco)
                zoom: 11.0,
              ),
              onTap: _handleTapp,
            ),
            if (_selectedLocation != null)
              Center(
                child: Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 48.0,
                ),
              ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (_selectedLocation != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(_selectedLocation = _selectedLocation),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Lütfen bir konum seçin"),
                backgroundColor: Colors.red,
              ));
            }
          },
          label: Text('Save Location'),
          icon: Icon(Icons.check),
        ));
  }
}
*/
