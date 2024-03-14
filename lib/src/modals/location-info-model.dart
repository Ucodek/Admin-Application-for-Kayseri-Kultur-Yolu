// ignore_for_file: file_names, unnecessary_getters_setters
class LocationInfoModel {
  double? _longitude;
  double? _latitude;

  LocationInfoModel({double? longitude, double? latitude}) {
    if (longitude != null) {
      _longitude = longitude;
    }
    if (latitude != null) {
      _latitude = latitude;
    }
  }

  double? get longitude => _longitude;
  set longitude(double? longitude) => _longitude = longitude;
  double? get latitude => _latitude;
  set latitude(double? latitude) => _latitude = latitude;

  LocationInfoModel.fromJson(Map<String, dynamic> json) {
    _longitude = json['longitude'];
    _latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    return {
      'longitude': _longitude,
      'latitude': _latitude,
    };
  }
}
