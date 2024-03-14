import 'dart:collection';
/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deneme_1/src/localization/Get_Location.dart';
import 'package:deneme_1/src/modals/location-info-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';

class MyHomePage extends StatefulWidget {
  final LatLng? selectedLocation;
  const MyHomePage(LatLng? this.selectedLocation, {super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _structureNameController =
      TextEditingController();
  final TextEditingController _architecturalFeatsController =
      TextEditingController();
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _whatToDoController = TextEditingController();
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();

  final dataBase = FirebaseFirestore.instance;
  late final double newVersion;
  @override
  void initState() {
    super.initState();
    if (widget.selectedLocation != null) {
      _latitudeController.text = widget.selectedLocation!.latitude.toString();
      _longitudeController.text = widget.selectedLocation!.longitude.toString();
    } else {}
  }

  Future<void> increaseVersion() async {
    final docRef =
        FirebaseFirestore.instance.collection('Config').doc('config');
    try {
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        final doc = await transaction.get(docRef);
        final currentVersion = doc.get('version');
        final newVersion = currentVersion + 0.01;
        transaction.update(docRef, {'version': newVersion});
      });
      print('Versiyon numarası $newVersion olarak güncellendi.');
    } catch (error) {
      print('Versiyon numarası güncellenemedi: $error');
    }
  }

  Future<void> saveData() async {
    final docRef = FirebaseFirestore.instance
        .collection('HistoricalBuildings')
        .doc(_idController.text);
    final data = Structure(
            int.parse(_idController.text),
            _structureNameController.text,
            _textController.text,
            _architecturalFeatsController.text,
            null,
            null,
            _whatToDoController.text,
            LocationInfoModel(
                latitude: widget.selectedLocation!.latitude.toDouble(),
                longitude: widget.selectedLocation!.longitude.toDouble()),
            null)
        .toJson();

    await docRef.set(data);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Admin application"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    controller: _idController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'id'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    controller: _structureNameController,
                    decoration:
                        const InputDecoration(hintText: 'Structure Name'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    controller: _architecturalFeatsController,
                    decoration:
                        const InputDecoration(hintText: 'architecturalFeats'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(hintText: 'text'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    controller: _whatToDoController,
                    decoration: const InputDecoration(hintText: 'whatToDo'),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 15, bottom: 15),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[800],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: TextField(
                          controller: _latitudeController,
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: 'Latitude',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 15, bottom: 15, right: 15),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[800],
                      ),
                      child: TextField(
                        controller: _longitudeController,
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: 'Longitude',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MapScreen()));
              },
              child: Icon(
                Icons.map_outlined,
                size: 50,
                color: Colors.blue,
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                ),
                onPressed: () async {
                  increaseVersion();
                  final docRef = FirebaseFirestore.instance
                      .collection('HistoricalBuildings')
                      .doc(_idController.text);

                  try {
                    await saveData();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Data saved successfully!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  } catch (error) {
                    print('Error saving data: $error');
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('An error occurred. Please try again.'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }

                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Kaydedildi"),
                    backgroundColor: Colors.green,
                  ));
                },
                child: Container(
                    child: Text(
                  'Save it',
                  style: TextStyle(color: Colors.black),
                )))
          ],
        ),
      ),
    );
  }
}

*/