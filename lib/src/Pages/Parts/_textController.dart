
import 'package:flutter/material.dart';

Widget textController (TextEditingController controller){
  return Container(
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(hintText: 'text'),
                  ),
                ),
              );
}