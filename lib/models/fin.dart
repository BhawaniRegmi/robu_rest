import 'package:flutter/material.dart'; 
class Mainunit extends StatelessWidget{
  const Mainunit();
  int value;
  String name;

  Widget getName(){
    return Container(
      margin: EdgeInsets.all(),
      
      child: SizedBox(
        height: 20,
        width: 20,
      ),
    ); 
  }

}