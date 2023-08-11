import 'package:flutter/material.dart';


const coloList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.orange,
  Colors.pink
];


class AppTheme {
    
  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
  }):assert( selectedColor >= 0, 'Selected color must be greater then 0' ),
    assert( selectedColor < coloList.length, 
      'Selected color must be less or equal then ${ coloList.length  -1 }' );


  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: coloList[ selectedColor ],
    appBarTheme: const AppBarTheme(
      centerTitle: false,
    )
  );

}