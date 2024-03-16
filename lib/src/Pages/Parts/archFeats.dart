import 'package:flutter/material.dart';

Widget archfeatsController (TextEditingController Controller){
    return Container(
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    controller: Controller,
                    decoration:
                        const InputDecoration(hintText: 'architecturalFeats'),
                  ),
                ),
              );
}