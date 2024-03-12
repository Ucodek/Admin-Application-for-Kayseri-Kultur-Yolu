import 'dart:convert';

import 'package:deneme_1/src/modals/LocationInfo.dart';
import 'package:deneme_1/src/modals/category-enum.dart';
import 'package:flutter/foundation.dart';

class Structure {
  late int _id;
  late String _structureName;
  String? _text;
  late String _architecturalFeats;
  List<String>? _oldImages;
  List<String>? _upToDateImages;
  String? _whatToDo;
  LocationInfoModel? _locationInfo;
  Categories? _categories;

  Structure(
      int id,
      String structureName,
      String text,
      String architecturalFeats,
      List<String>? oldImages,
      List<String>? upToDateImages,
      String? whatToDo,
      LocationInfoModel locationInfo,
      Categories? category
      ) 
      {
    if (id != null) {
      _id = id;
    }
    if (structureName != null) {
      _structureName = structureName;
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
      _categories = category;
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _structureName;
    data['text'] = _text;
    data['architecturalFeats'] = _architecturalFeats;
    data['oldImages'] = jsonEncode(_oldImages);
    data['upToDateImages'] = jsonEncode(_upToDateImages);
    data['whatToDo'] = _whatToDo;
    if (_locationInfo != null) {
      data['locationInfo'] = jsonEncode(_locationInfo!.toJson());
    }
    if (_categories != null) {
      data["category"] = jsonEncode(_categories!.id());
    }
    return data;
  }
}
