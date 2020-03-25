import 'package:flutter/material.dart';
import './ui/BmiApp.dart';

void main(){
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'BMI',
    home :new BmiApp(),
  ));
}