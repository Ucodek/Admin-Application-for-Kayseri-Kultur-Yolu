// ignore_for_file: file_names, unnecessary_getters_setters
import 'package:deneme_1/src/modals/styles/String.dart';


class LocationInfoModel {
  double? _longitude;
  double? _latitude;
  double? _imageLongitude;
  double? _imageLatitude;

  LocationInfoModel({
    double? longitude,
    double? latitude,
    double? imageLongitude,
    double? imageLatitude,
  }) {
    if (longitude != null) {
      _longitude = longitude;
    }
    if (latitude != null) {
      _latitude = latitude;
    }
    if (imageLatitude != null) {
      _imageLatitude = imageLatitude;
    }
    if (imageLongitude != null) {
      _imageLongitude = imageLongitude;
    }
  }

  double? get longitude => _longitude;
  set longitude(double? longitude) => _longitude = longitude;
  double? get latitude => _latitude;
  set latitude(double? latitude) => _latitude = latitude;
  double? get imageLatitude => _imageLatitude;
  set imageLatitude(double? imageLatitude) => _imageLatitude = imageLatitude;
  double? get imageLongitude => _imageLongitude;
  set imageLongitude(double? imageLongitude) => _imageLongitude = imageLongitude;

  LocationInfoModel.fromJson(Map<String, dynamic> json) {
    _longitude = json[JsonDataTagNames.longitude];
    _latitude = json[JsonDataTagNames.latitude];
    _imageLatitude = json[JsonDataTagNames.imageLatitude];
    _imageLongitude = json[JsonDataTagNames.imageLongitude];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      JsonDataTagNames.longitude: _longitude,
      JsonDataTagNames.latitude: _latitude,
      JsonDataTagNames.imageLatitude: _imageLatitude,
      JsonDataTagNames.imageLongitude: _imageLongitude,
    };
  }

  @override
  LocationInfoModel fromJson(Map<String, dynamic> json) {
    throw LocationInfoModel.fromJson(json);
  }
}
