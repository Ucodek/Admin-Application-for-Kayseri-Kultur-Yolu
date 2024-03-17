import 'dart:async';
import 'package:deneme_1/src/Pages/Parts/SaveButtonEng.dart';
import 'package:deneme_1/src/Pages/Parts/_PhotoLongController.dart';
import 'package:deneme_1/src/Pages/Parts/_modelLongController.dart';
import 'package:deneme_1/src/Pages/Parts/_idController.dart';
import 'package:deneme_1/src/Pages/Parts/_modelLatController.dart';
import 'package:deneme_1/src/Pages/Parts/_nameController.dart';
import 'package:deneme_1/src/Pages/Parts/_photoLatController.dart';
import 'package:deneme_1/src/Pages/Parts/_textController.dart';
import 'package:deneme_1/src/Pages/Parts/_whatToDoController.dart';
import 'package:deneme_1/src/Pages/Parts/archFeats.dart';
import 'package:deneme_1/src/data/DataManager.dart';
import 'package:deneme_1/src/modals/historical-building-model.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class englishRecord extends StatefulWidget {
  const englishRecord({super.key});

  @override
  State<englishRecord> createState() => _englishRecordState();
}

class _englishRecordState extends State<englishRecord> {
  TextEditingController _idController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _architecturalFeatsController = TextEditingController();
  TextEditingController _textController = TextEditingController();
  TextEditingController _whatToDoController = TextEditingController();
  TextEditingController _modelLatController = TextEditingController();
  TextEditingController _modelLongController = TextEditingController();
  TextEditingController _photoLatController = TextEditingController();
  TextEditingController _photoLongController = TextEditingController();
  List<HistoricalBuildingModel> models = [];
  Future<List<HistoricalBuildingModel>> getData() async {
    return await DataManager.getModels();
  }

  LatLng? modelLoc;

  LatLng? photoLoc;

  int selectedIndex = 0;

  Widget? content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getContentWidget(selectedIndex),
    );
  }

  Widget getContentWidget(int index) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: () async {
                photoLoc = await DataManager.requestPhotoLocPinLatLng(context);
                if (photoLoc != null) {
                  _photoLatController.text = photoLoc!.latitude.toString();
                  _photoLongController.text = photoLoc!.longitude.toString();
                }
                setState(() {});
                ScaffoldMessenger.of(context)
                  ..removeCurrentSnackBar()
                  ..showSnackBar(SnackBar(content: Text('$modelLoc' + ' Eklendi')));
              },
              child: Text("Resim Pin konum ekleme")),
          ElevatedButton(
              onPressed: () async {
                modelLoc = await DataManager.requestModelLocPinLatLng(context);
                if (modelLoc != null) {
                  _modelLatController.text = modelLoc!.latitude.toString();
                  _modelLongController.text = modelLoc!.longitude.toString();
                  setState(() {});
                  ScaffoldMessenger.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(SnackBar(content: Text('$photoLoc' + ' Eklendi')));
                }
              },
              child: Text("Pin konum")),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                photoLatController(_photoLatController),
                modelLatController(_modelLatController),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: photoLongController(_photoLongController),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ModelLongController(_modelLongController),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: idController(_idController),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: nameController(_nameController),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: archfeatsController(_architecturalFeatsController),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: textController(_textController),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: whatToDo(_whatToDoController),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: ElevatedButton(
                  onPressed: () {
                    saveItEng(
                        _idController,
                        _nameController,
                        _architecturalFeatsController,
                        _textController,
                        _whatToDoController,
                        _modelLatController,
                        _modelLongController,
                        _photoLatController,
                        _photoLongController);
                  },
                  child: Text("Save it")),
            ),
          ],
        ),
      ),
    );
  }
}
