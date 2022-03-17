import 'package:flutter/material.dart';
class Ahades extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
      body: ListView(
        children: [
          Image(image: AssetImage('assets/h1.jpg'),),
          Image(image: AssetImage('assets/h2.jpg'),),
          Image(image: AssetImage('assets/h3.jpg'),),
          Image(image: AssetImage('assets/h4.png'),),
          Image(image: AssetImage('assets/h5.jpg'),),
          Image(image: AssetImage('assets/h6.jpg'),)

        ],
      ),);
  }
}
