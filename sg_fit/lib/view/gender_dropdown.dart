import 'package:flutter/material.dart';

class ChangeTextColorDropdown extends StatefulWidget {
  @override
  ChangeTextColorDropdownState createState() {
    return new ChangeTextColorDropdownState();
  }
}

class ChangeTextColorDropdownState extends State<ChangeTextColorDropdown> {
  List<ColorModel> _colors = [
    ColorModel(color: Colors.blue, colorName: "Blue"),
    ColorModel(color: Colors.purple, colorName: "Purple"),
    ColorModel(color: Colors.pink, colorName: "Pink"),
    ColorModel(color: Colors.teal, colorName: "Teal"),
    ColorModel(color: Colors.amber, colorName: "Amber"),
    ColorModel(color: Colors.brown, colorName: "Brown"),
  ];
  Color _selectedColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Text Color - DropdownButton'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            DropdownButton<Color>(
              items: _colors
                  .map((color) => DropdownMenuItem<Color>(
                        child: Text(
                          color.colorName,
                          style: TextStyle(
                            color: _selectedColor,
                          ),
                        ),
                        value: color.color,
                      ))
                  .toList(),
              onChanged: (Color value) {
                setState(() => _selectedColor = value);
              },
              hint: Text(
                'Change Text Color',
                style: TextStyle(
                  color: _selectedColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Create a Model class to hold key-value pair data
class ColorModel {
  String colorName;
  Color color;

  ColorModel({this.colorName, this.color});
}
