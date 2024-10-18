import 'package:flutter/material.dart';

class Dropdownitems {
  static List<DropdownMenuItem<String>>? items = [
    const DropdownMenuItem(value: "Gryffindor", child: Text("Gryffindor")),
    const DropdownMenuItem(value: "Hufflepuff", child: Text("Hufflepuff")),
    const DropdownMenuItem(value: "Ravenclaw", child: Text("Ravenclaw")),
    const DropdownMenuItem(value: "Slytherin", child: Text("Slytherin")),
  ];
}
