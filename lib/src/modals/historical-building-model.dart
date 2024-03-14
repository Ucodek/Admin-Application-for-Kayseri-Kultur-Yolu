// ignore_for_file: file_names, unnecessary_getters_setters

import 'dart:convert';

import 'package:deneme_1/src/modals/IStorable.dart';
import 'package:deneme_1/src/modals/category-enum.dart';
import 'package:deneme_1/src/modals/location-info-model.dart';

class HistoricalBuildingModel implements IStorable<HistoricalBuildingModel> {
  String? _id;
  String? _name;
  String? _text;
  String? _architecturalFeats;
  List<String>? _oldImages;
  List<String>? _upToDateImages;
  String? _whatToDo;
  LocationInfoModel? _locationInfo;
  Categories? _category;

  HistoricalBuildingModel({
    String? id,
    String? name,
    String? text,
    String? architecturalFeats,
    List<String>? oldImages,
    List<String>? upToDateImages,
    String? whatToDo,
    LocationInfoModel? locationInfo,
    Categories? category,
  }) {
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (text != null) {
      _text = text;
    }
    if (architecturalFeats != null) {
      _architecturalFeats = architecturalFeats;
    }
    if (oldImages != null) {
      _oldImages = oldImages;
    }
    if (upToDateImages != null) {
      _upToDateImages = upToDateImages;
    }
    if (whatToDo != null) {
      _whatToDo = whatToDo;
    }
    if (locationInfo != null) {
      _locationInfo = locationInfo;
    }
    if (category != null) {
      _category = category;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get text => _text;
  set text(String? text) => _text = text;
  String? get architecturalFeats => _architecturalFeats;
  set architecturalFeats(String? architecturalFeats) =>
      _architecturalFeats = architecturalFeats;
  List<String>? get oldImages => _oldImages;
  set oldImages(List<String>? oldImages) => _oldImages = oldImages;
  List<String>? get upToDateImages => _upToDateImages;
  set upToDateImages(List<String>? upToDateImages) => _upToDateImages = upToDateImages;
  String? get whatToDo => _whatToDo;
  set whatToDo(String? whatToDo) => _whatToDo = whatToDo;
  LocationInfoModel? get locationInfo => _locationInfo;
  set locationInfoModel(LocationInfoModel? locationInfo) => _locationInfo = locationInfo;
  Categories? get category => _category;
  set category(Categories? category) => _category = category;

  //TODO: change it Map<String, dynamic>
  HistoricalBuildingModel.fromJson(Map<dynamic, dynamic> jsonData) {
    _id = jsonData['id'].toString();
    _name = jsonData['name'];
    _text = jsonData['text'];
    _architecturalFeats = jsonData['architecturalFeats'];
    _oldImages = jsonData['oldImages'] != null
        ? (jsonDecode(jsonData['oldImages']) as List?)
            ?.map((item) => item as String)
            .toList()
        : null;
    _upToDateImages = jsonData['upToDateImages'] != null
        ? (jsonDecode(jsonData['upToDateImages']) as List)
            .map((item) => item as String)
            .toList()
        : null;
    _whatToDo = jsonData['whatToDo'];
    _locationInfo = jsonData['locationInfo'] != null
        ? LocationInfoModel.fromJson(
            (jsonDecode(jsonData['locationInfo']) as Map<String, dynamic>),
          )
        : null;
    _category = jsonData["category"] != null
        ? getCategoryById(jsonDecode(jsonData["category"]))
        : null;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['text'] = _text;
    data['architecturalFeats'] = _architecturalFeats;
    data['oldImages'] = jsonEncode(_oldImages);
    data['upToDateImages'] = jsonEncode(_upToDateImages);
    data['whatToDo'] = _whatToDo;
    if (_locationInfo != null) {
      data['locationInfo'] = jsonEncode(_locationInfo!.toJson());
    }
    if (_category != null) {
      data["category"] = jsonEncode(_category!.id());
    }
    return data;
  }

  @override
  HistoricalBuildingModel fromJson(Map<String, dynamic> json) {
    return HistoricalBuildingModel.fromJson(json);
  }
}
