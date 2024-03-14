import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class PhotoLocPicker extends StatefulWidget {
  const PhotoLocPicker({super.key});

  @override
  State<PhotoLocPicker> createState() => _PhotoLocPickerState();
}

class _PhotoLocPickerState extends State<PhotoLocPicker> {
  final LatLngBounds _bounds = LatLngBounds(
    const LatLng(38.744718, 35.458184),
    const LatLng(38.707669, 35.508274),
  );

  LatLng? tapPoint;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        if (tapPoint != null)
          ElevatedButton(
            onPressed: () async {
              bool? isOK = await throwApproveRequest();
              if (isOK != null && isOK) {
                Navigator.of(context).pop(tapPoint);
              }
            },
            child: Text("Save"),
          )
      ]),
      body: FlutterMap(
        options: MapOptions(
          onTap: (tapPosition, point) {
            tapPoint = point;
            setState(() {});
          },
          //maxZoom: 17,
          interactionOptions: const InteractionOptions(
            flags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
            enableScrollWheel: true,
          ),
          cameraConstraint: CameraConstraint.contain(bounds: _bounds),
          initialCameraFit: CameraFit.insideBounds(bounds: _bounds),
        ),
        children: [
          OverlayImageLayer(
            overlayImages: [
              OverlayImage(
                  imageProvider: const AssetImage("assets/td_map.jpg"), bounds: _bounds)
            ],
          ),
          if (tapPoint != null)
            MarkerLayer(markers: [
              Marker(
                  point: tapPoint!,
                  child: Icon(
                    Icons.location_on_rounded,
                    color: Colors.blue,
                    size: 50,
                  ))
            ])
        ],
      ),
    );
  }

  Future<bool?> throwApproveRequest() async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Konumu onaylıyor musunuz"),
          content: Text(tapPoint.toString()),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text("Hayır")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text("Evet")),
          ],
        );
      },
    );
  }
}
