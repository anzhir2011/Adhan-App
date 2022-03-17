import 'package:flutter/material.dart';
class AzkarMasaa extends StatefulWidget {
  @override
  _AzkarMasaaState createState() => _AzkarMasaaState();
}

class _AzkarMasaaState extends State<AzkarMasaa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
      body: ListView(
        children: [
          Image(image: AssetImage('assets/m1.png'),),
          Image(image: AssetImage('assets/m2.jpg'),),
          Image(image: AssetImage('assets/m3.jpg'),),
          Image(image: AssetImage('assets/m4.gif'),)
        ],
      ),);
  }
}
