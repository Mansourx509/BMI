import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new BmiAppState();
  }
}

class BmiAppState extends State<BmiApp>{
  String finalresult = "";
  final TextEditingController _ageController = new TextEditingController ();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  double height_in_meters = 0.0;
  double  result;
  void _calculateBMI(){
    setState(() {

      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text);
      height_in_meters = height / 100;
      int weight = int.parse(_weightController.text);

      if((_ageController.text.isNotEmpty || age > 0)
          &&(_heightController.text.isNotEmpty || height > 0 )
          &&( _weightController.text.isNotEmpty || weight > 0)){
        result = weight / (height_in_meters * height_in_meters);

        if(result < 18.5)
          finalresult = "UnderWeight";
        else if(18.5 < result && result < 24.9 )
          finalresult = "Normal";
        else if(25.0 < result && result < 29.9 )
          finalresult = "OverWeight";
        else
          finalresult = "Above Obese";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ) ,
      backgroundColor: Colors.white,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            Image.asset(
              'images/111 bmilogo.png',
              width: 120.0,
              height: 90.0,
              //color: Colors.white,
            ),
            new Padding(padding: const EdgeInsets.all(10.5)),
            new Container(
              height: 270.0,
              width: 410.0,
              color: Colors.grey.shade300,
              child: new Column(
                children: <Widget>[
                  new Padding(padding: const EdgeInsets.all(8.5)),
                  new TextFormField(
                    controller: _ageController,
                    decoration: new InputDecoration(
                      hintText: "Age",
                      icon: Icon(Icons.person)
                    ),
                  ),
                  new Padding(padding: const EdgeInsets.all(8.5)),
                  new TextFormField(
                    controller: _heightController,
                    decoration: new InputDecoration(
                        hintText: "Height in cm",
                        icon: Icon(Icons.check_circle),
                    ),
                  ),
                  new Padding(padding: const EdgeInsets.all(8.5)),
                  new TextFormField(
                    controller: _weightController,
                    decoration: new InputDecoration(
                      hintText: "Weight in kg",
                      icon: Icon(Icons.line_weight),
                    ),
                  ),
                  new Padding(padding: const EdgeInsets.all(8.5)),
                  new Center(
                    child: new Row(
                      children: <Widget>[
                        new Container(
                          margin : const EdgeInsets.only(left : 150.0),
                          child: new RaisedButton(
                            onPressed: _calculateBMI,
                            color: Colors.pinkAccent,
                            child: Text("Calculate",style: new TextStyle(color: Colors.white , fontSize: 16.9),),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            new Padding(padding: const EdgeInsets.all(8)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Your BMI: $result ",
                  style: TextStyle(color: Colors.blueAccent ,
                    fontSize: 24.0 ,
                    fontWeight: FontWeight.w500
                  ),
                )
              ],
            ),
            new Padding(padding: const EdgeInsets.all(8)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("$finalresult ",
                  style: TextStyle(color: Colors.pinkAccent ,
                      fontSize: 24.0 ,
                      fontWeight: FontWeight.w500
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

}