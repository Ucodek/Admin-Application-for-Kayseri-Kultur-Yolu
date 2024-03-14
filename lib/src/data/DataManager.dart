// ignore_for_file: file_names

import 'package:deneme_1/src/data/DatabaseManagers/firebase/FirebaseManager.dart';
import 'package:deneme_1/src/data/tolgaTestPages/model_loc_picker.dart';
import 'package:deneme_1/src/modals/historical-building-model.dart';
import 'package:deneme_1/src/data/tolgaTestPages/photo_loc_picker.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class DataManager {
  static Future<List<HistoricalBuildingModel>> getModels() async {
    var response = await FirebaseManager.getAll();
    return response;
  }

  static Future<void> insertModel(HistoricalBuildingModel model) async {
    await FirebaseManager.insert(model);
    await _increaseVersion();
  }

  static Future<void> updateModel(String id, HistoricalBuildingModel updatedModel) async {
    await FirebaseManager.update(id, updatedModel);
    await _increaseVersion();
  }

  static Future<HistoricalBuildingModel> getModel(String id) async {
    return await FirebaseManager.get(id);
  }

  static Future<void> _increaseVersion() async {
    double? version = await FirebaseManager.getVersion();

    if (version != null) {
      version += .01;
      await FirebaseManager.updateVersion(version);
    }
  }

  static Future<LatLng?> requestPhotoLocPinLatLng(BuildContext context) async {
    return await Navigator.of(context).push<LatLng?>(MaterialPageRoute(
      builder: (context) => PhotoLocPicker(),
    ));
  }

  static Future<LatLng?> requestModelLocPinLatLng(BuildContext context) async {
    return await Navigator.of(context).push<LatLng?>(MaterialPageRoute(
      builder: (context) => ModellocPicker(),
    ));
  }
}

enum DataKeys {
  models,
  version,
  favorites,
}
