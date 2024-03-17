import 'package:deneme_1/src/data/DatabaseManagers/firebase/FirebaseManager.dart';
import 'package:deneme_1/src/modals/category-enum.dart';
import 'package:deneme_1/src/modals/historical-building-model.dart';
import 'package:deneme_1/src/modals/location-info-model.dart';
import 'package:flutter/material.dart';

Widget saveItTR(
  TextEditingController idController,
  TextEditingController nameController,
  TextEditingController architecturalFeatsController,
  TextEditingController textController,
  TextEditingController whatToDoController,
  TextEditingController modelLatController,
  TextEditingController modelLongController,
  TextEditingController photoLatController,
  TextEditingController photoLongController,
) {
  return ElevatedButton(
      onPressed: () async {
        String id = idController.text;
        String name = nameController.text;
        String architecturalFeats = architecturalFeatsController.text;
        String text = textController.text;
        String whatToDo = whatToDoController.text;
        double modelLat = double.parse(modelLatController.text);
        double modelLong = double.parse(modelLongController.text);
        double photoLat = double.parse(photoLatController.text);
        double photoLong = double.parse(photoLongController.text);

        HistoricalBuildingModel model = HistoricalBuildingModel(
          id: id,
          name: name,
          architecturalFeats: architecturalFeats,
          text: text,
          whatToDo: whatToDo,
          locationInfo: LocationInfoModel(
              latitude: modelLat,
              longitude: modelLong,
              imageLatitude: photoLat,
              imageLongitude: photoLong),
          category: Categories.bathhouse,
          oldImages: [],
          upToDateImages: [],
        );

        await FirebaseManager.saveData(id, model);
      },
      child: Text("Save Data"));
}
