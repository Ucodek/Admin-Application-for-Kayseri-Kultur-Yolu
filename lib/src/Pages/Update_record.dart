import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class updateScreen extends StatefulWidget {
  final Map<String, dynamic> structureDetails;

  const updateScreen({super.key, required this.structureDetails});

  @override
  State<updateScreen> createState() => _updateScreenState();
}

class _updateScreenState extends State<updateScreen> {

   final TextEditingController _idController = TextEditingController();
  final TextEditingController _structureNameController =TextEditingController();
  final TextEditingController _architecturalFeatsController = TextEditingController();
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _whatToDoController = TextEditingController();

  final dataBase = FirebaseFirestore.instance;
  
  void initState() {
    super.initState();
    _idController.text = widget.structureDetails['id'].toString();
    _structureNameController.text = widget.structureDetails['name'];
    _architecturalFeatsController.text = widget.structureDetails['architecturalFeats'];
    _textController.text = widget.structureDetails['text'];
    _whatToDoController.text = widget.structureDetails['whatToDo'];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Data"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  controller: _idController,
                
                  decoration: const InputDecoration(hintText: 'id'),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  controller: _structureNameController,
              
                  decoration: const InputDecoration(hintText: 'Structure Name'),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  controller: _architecturalFeatsController,
                
                  decoration: const InputDecoration(hintText: 'architecturalFeats'),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  controller: _textController,
                  
                  decoration: const InputDecoration(hintText: 'text'),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  controller: _whatToDoController,
           
                  decoration: const InputDecoration(hintText: 'whatToDo'),
                ),
              ),
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
              ),
              onPressed: () async{
                FirebaseFirestore.instance.collection('HistoricalBuildings').doc(_idController.text).set({
                  'id' : _idController.text,
                  'name' : _structureNameController.text,
                  'architecturalFeats' : _architecturalFeatsController.text,
                  'text' : _textController.text,
                  'whatToDo' : _whatToDoController.text,
                }, );
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Kaydedildi"), backgroundColor: Colors.green,));
              },
              child: Container(
                  child: Text(
                'Save it',
                style: TextStyle(color: Colors.black),
              )))
        ],
      ),
    );
  }
}
