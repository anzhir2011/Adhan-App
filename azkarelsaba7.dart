import 'package:flutter/material.dart';
class AzkarSabah extends StatefulWidget {
  @override
  _AzkarSabahState createState() => _AzkarSabahState();
}

class _AzkarSabahState extends State<AzkarSabah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
    body: ListView(
      children: [
        Image(image: AssetImage('assets/s1.jpg'),),
        Image(image: AssetImage('assets/s2.jpg'),),
        Image(image: AssetImage('assets/s3.jpg'),),
        Image(image: AssetImage('assets/s4.jpg'),)
      ],
    ),);
  }
}
