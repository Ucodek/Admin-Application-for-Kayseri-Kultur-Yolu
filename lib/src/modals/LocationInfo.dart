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
  Map<String, dynamic> toJson() {
    return {
      'longitude': _longitude,
      'latitude': _latitude,
    };
  }
}