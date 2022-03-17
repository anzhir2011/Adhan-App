import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'alllmycode.dart';

main() {
  runApp(MaterialApp(home: LocStart(),
  debugShowCheckedModeBanner: false,
  ));
}

class LocStart extends StatefulWidget {
  @override
  _LocStartState createState() => _LocStartState();
}

class _LocStartState extends State<LocStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
        backgroundColor: Color(0x44000000),
        elevation: 0, //controls the size of the shadow
        title: Text(
          "Prayer Times",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        leading: Icon(
          Icons.water_damage,
          color: Colors.white,
          size: 30,
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(top: 50), 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [FloatingActionButton.extended(icon: Icon(Icons.location_off ),
            label:Text("Activate Location"),
              onPressed: () async
              {
                Location location = new Location();
                PermissionStatus _permissionGranted;
                LocationData _locationData;

                //waiting to get the permission from the user , once clicked
                _permissionGranted = await location.hasPermission();
                if (_permissionGranted == PermissionStatus.denied) {
                  _permissionGranted = await location.requestPermission();
                }
                _locationData = await location.getLocation();
                setState(() {
                  if(_permissionGranted==PermissionStatus.granted)
                  {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (PAGE){
                          PrayTimes pt = PrayTimes(_locationData);
                          return pt;
                        })
                    );
                  }

                });

              },
            )],
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/asset3.jpg'), fit: BoxFit.cover)),
      ),
    );
  }
}
