import 'package:async_builder/async_builder.dart';
import 'package:deneme_1/src/data/DataManager.dart';
import 'package:deneme_1/src/modals/historical-building-model.dart';
import 'package:deneme_1/src/data/tolgaTestPages/photo_loc_picker.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class DataTestPage extends StatefulWidget {
  const DataTestPage({super.key});

  @override
  State<DataTestPage> createState() => _DataTestPageState();
}

class _DataTestPageState extends State<DataTestPage> {
  List<HistoricalBuildingModel> models = [];
  Future<List<HistoricalBuildingModel>> getData() async {
    return await DataManager.getModels();
  }

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
                    var response = await DataManager.requestPhotoLocPinLatLng(context);
                    setState(() {});
                    print(response.toString());
                  },
                  child: Text("Resim Pin konum ekleme")),
              ElevatedButton(
                  onPressed: () async {
                    var response = await DataManager.requestModelLocPinLatLng(context);
                    setState(() {});
                    print(response.toString());
                  },
                  child: Text("Model Pin konum ekleme")),
            ],
          ),
        );
      default:
        return Placeholder();
    }
  }
}
