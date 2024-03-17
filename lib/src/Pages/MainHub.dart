import 'dart:async';

import 'package:async_builder/async_builder.dart';
import 'package:deneme_1/src/Pages/EngRecord.dart';
import 'package:deneme_1/src/Pages/Parts/SaveButton.dart';
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

class MainHub extends StatefulWidget {
  const MainHub({super.key});

  @override
  State<MainHub> createState() => _MainHub();
}

class _MainHub extends State<MainHub> {
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "list"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "add"),
        ],
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        onTap: (value) {
          selectedIndex = value;
          setState(() {});
        },
      ),
    );
  }

  Widget getContentWidget(int index) {
    switch (index) {
      case 0:
        return AsyncBuilder(
          future: getData(),
          waiting: (context) => CircularProgressIndicator(),
          builder: (context, value) => Scaffold(
            appBar: AppBar(
              actions: [],
            ),
            body: ListView.builder(
              itemCount: value?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(value?[index].name ?? "null"),
                  onTap: () {},
                );
              },
            ),
          ),
        );
      case 1:
        return Scaffold(
          appBar: AppBar(
            actions: [
              ElevatedButton(
                  onPressed: () async {
                    photoLoc =
                        await DataManager.requestPhotoLocPinLatLng(context);
                    if (photoLoc != null) {
                      _photoLatController.text = photoLoc!.latitude.toString();
                      _photoLongController.text =
                          photoLoc!.longitude.toString();
                    }
                    setState(() {});
                    ScaffoldMessenger.of(context)
                      ..removeCurrentSnackBar()
                      ..showSnackBar(
                          SnackBar(content: Text('$modelLoc' + ' Eklendi')));
                  },
                  child: Text("Resim konum")),
              ElevatedButton(
                  onPressed: () async {
                    modelLoc =
                        await DataManager.requestModelLocPinLatLng(context);
                    if (modelLoc != null) {
                      _modelLatController.text = modelLoc!.latitude.toString();
                      _modelLongController.text =
                          modelLoc!.longitude.toString();
                          setState(() {});
                    ScaffoldMessenger.of(context)
                      ..removeCurrentSnackBar()
                      ..showSnackBar(
                          SnackBar(content: Text('$photoLoc' + ' Eklendi')));
                    }
                    
                  },
                  child: Text("Pin konum")),
                  ElevatedButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> englishRecord()));
                  },  child: Text("English"))
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
                Padding(padding: EdgeInsets.all(8),
                child: ElevatedButton(onPressed: () { saveItTR(_idController, _nameController, _architecturalFeatsController, _textController, _whatToDoController, _modelLatController, _modelLongController, _photoLatController, _photoLongController); },
                child: Text("Save it")
                ),
                ),
              ],
            ),
          ),
        );

      default:
        return Placeholder();
    }
  }
}
