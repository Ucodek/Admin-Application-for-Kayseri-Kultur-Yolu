import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deneme_1/src/Pages/Update_record.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final dataBase = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: dataBase.collection('HistoricalBuildings').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final structures = snapshot.data!.docs.reversed.toList();

        return ListView.builder(
          itemCount: structures.length,
          itemBuilder: (context, index) {
            final structure = structures[index].data() as Map<String, dynamic>;

            return Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align items at both ends
                children: [
                  Text(structure['name'].toString()),
                  Row( // Enclose icons in a Row to keeprror (type 'Null' is not a subtype of type 'String') them together
                    mainAxisAlignment: MainAxisAlignment.end, // Align icons to the right
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => _handleUpdate(structure),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _handleDelete(structures[index].reference),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

void _handleUpdate(Map<String, dynamic> structure) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => updateScreen(
        structureDetails: structure,
      ),
    ),
  );
}

  void _handleDelete(DocumentReference reference) async {
    try {
      await reference.delete();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Structure deleted successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting structure: $e')),
      );
    }
  }
}
