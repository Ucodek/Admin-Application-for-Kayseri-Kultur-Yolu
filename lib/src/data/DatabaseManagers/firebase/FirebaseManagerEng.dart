// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deneme_1/src/modals/historical-building-model.dart';

class FirebaseManagerEng {
  final int _version = 1;
  int get version => _version;
  static const String _tableName = "HistoricalBuildings_en";

  static final CollectionReference _reference =
      FirebaseFirestore.instance.collection(_tableName);

  static final CollectionReference _configReference =
      FirebaseFirestore.instance.collection("Config");

  static Future<bool> deleteAll() async {
    QuerySnapshot querySnapshot = await _reference.get();
    // ignore: avoid_function_literals_in_foreach_calls
    querySnapshot.docs.forEach((document) async {
      await document.reference.delete();
    });

    return true;
  }

  static Future<HistoricalBuildingModel> get(String modelId) async {
    HistoricalBuildingModel building = HistoricalBuildingModel();
    await _reference.doc(modelId.toString()).get().then(
      (DocumentSnapshot snapshot) {
        building =
            HistoricalBuildingModel.fromJson(snapshot.data() as Map<String, dynamic>);
      },
    );
    return building;
  }

  static Future<String> update(String id, HistoricalBuildingModel model) async {
    await _reference.doc(id.toString()).set(model.toJson());
    return id;
  }

  static Future<List<HistoricalBuildingModel>> getAll() async {
    List<HistoricalBuildingModel> buildings = [];
    await _reference.get().then(
      (QuerySnapshot querySnapshot) {
        buildings = querySnapshot.docs
            .map(
                (e) => HistoricalBuildingModel.fromJson(e.data() as Map<String, dynamic>))
            .toList();
      },
    );
    return buildings;
  }

  static Future<String> insert(HistoricalBuildingModel model) async {
    if (model.id == null) return "Error: Please enter ID number of model.";
    _reference.doc(model.id!.toString()).set(model.toJson());
    return model.id!;
  }

  Future<String> delete(String id) async {
    await _reference.doc(id.toString()).delete();
    return id;
  }

  static Future<void> updateVersion(double version) async {
    await _configReference.doc("config").set({
      'version': version,
    });
  }

  static Future<double?> getVersion() async {
    String? version;
    await _configReference.doc("config").get().then((DocumentSnapshot snapshot) {
      version = (snapshot.data() as Map<String, dynamic>)["version"].toString();
    });
    if (version != null) {
      return double.tryParse(version!);
    } else {
      return null;
    }
  }

  static Future<void> saveData(String id, HistoricalBuildingModel model) async {
    final docRef = FirebaseFirestore.instance.collection(_tableName).doc(id);
    final data = model.toJson();

    await docRef.set(data);
    await increaseVersionNum();
  }

  static Future<void> increaseVersionNum() async {
    var version = await getVersion();
    if (version != null) {
      await updateVersion(version + .001);
    }
  }
}

class FirebaseException implements Exception {
  String message;
  FirebaseException({required this.message});

  @override
  String toString() {
    return message;
  }
}
