// ignore_for_file: file_names

enum Categories {
  mosque,
  bathhouse,
  inn,
  madrasah,
  museum,
  unknown,
}

extension CategoryExtension on Categories {
  int id() {
    switch (this) {
      case Categories.mosque:
        return 0;
      case Categories.bathhouse:
        return 1;
      case Categories.inn:
        return 2;
      case Categories.madrasah:
        return 3;
      case Categories.museum:
        return 4;
      default:
        return -1;
    }
  }

  String getVisibleName() {
    switch (this) {
      case Categories.mosque:
        return "Mosque";
      case Categories.bathhouse:
        return "Bathhouse";
      case Categories.inn:
        return "Inn";
      case Categories.madrasah:
        return "Madrasah";
      case Categories.museum:
        return "Museum";
      default:
        return "Error";
    }
  }
}

Categories getCategoryById(int id) {
  if (id == Categories.bathhouse.id()) {
    return Categories.bathhouse;
  } else if (id == Categories.inn.id()) {
    return Categories.inn;
  } else if (id == Categories.mosque.id()) {
    return Categories.mosque;
  } else if (id == Categories.madrasah.id()) {
    return Categories.madrasah;
  } else if (id == Categories.museum.id()) {
    return Categories.museum;
  } else {
    return Categories.unknown;
  }
}
