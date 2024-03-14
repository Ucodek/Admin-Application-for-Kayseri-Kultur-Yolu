import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class ModellocPicker extends StatefulWidget {
  const ModellocPicker({super.key});

  @override
  State<ModellocPicker> createState() => _ModellocPickerState();
}

class _ModellocPickerState extends State<ModellocPicker> {
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
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
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
