import 'package:flutter/material.dart';

Widget ModelLongController(TextEditingController controller) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.grey[800],
      borderRadius: BorderRadius.circular(20)
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 60,
          width: 150,
          child: TextField(
            maxLines: null,
            controller: controller,
            decoration: InputDecoration(labelText: "model Long"),
          )),
    ),
  );
}
