import 'package:adhan/adhan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:prayertimesproject/a7ades.dart';
import 'package:prayertimesproject/azkarelmasa2.dart';
import 'package:prayertimesproject/azkarelsaba7.dart';
import 'package:prayertimesproject/timerisdone.dart';
import 'package:prayertimesproject/utilityfunctions.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:duration/duration.dart';

LocationData locationData;
Prayer nxt;

class PrayTimes extends StatefulWidget {
  LocationData x;
  PrayTimes(this.x) {
    locationData = x;
  }
  @override
  _PrayTimesState createState() => _PrayTimesState();
}

class _PrayTimesState extends State<PrayTimes> {
  var marginTimes=['0 minutes','3 minutes','5 minutes' ,'7 minutes'];
  var dropDownValue='0 minutes';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Welcome Back !',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.accessibility),
                title: Text(
                  "اذكار الصباح",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (v){
                      return AzkarSabah();
                    })
                  );
                },
              ),
              color: Colors.green,
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.add_box_outlined),
                title: Text(
                  "اذكار المساء",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (v){
                        return AzkarMasaa();
                      })
                  );
                },
              ),
              color: Colors.green,
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.code),
                title: Text(
                 "احاديث نبوية",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (v){
                        return Ahades();
                      })
                  );
                },
              ),
              color: Colors.green,
            )


          ],
        ),
      ),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color(0x44000000),
        elevation: 0,
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
        padding: EdgeInsets.only(top: 70), //34an el app bar mn fo2
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch,  mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  Date.getDate()["day"],
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Date.getDate()["month"],
                style: TextStyle(color: Colors.white, fontSize: 20),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Date.getDate()["year"],
                style: TextStyle(color: Colors.white, fontSize: 20),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Colors.black),
                color: Colors.blue,
                shape: BoxShape.circle),
            child: AnalogClock(
              isLive: true,
              showDigitalClock: true,
              height: 150,
              width: 150,
              textScaleFactor: 1.4,
              showAllNumbers: true,
              numberColor: Colors.white,
              digitalClockColor: Colors.white,
              tickColor: Colors.white,
              hourHandColor: Colors.black,
              minuteHandColor: Colors.black,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                nextPrayerStr,
                style: TextStyle(color: Colors.white, fontSize: 20),
              )
            ],
          ),
          Center(
            child: Countdown(
                seconds: 5 ,
                build: (_, time) => Text(
                      "Remaining Time : " +
                          printDuration(Duration(seconds: time.toInt())),
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                interval: Duration(
                  milliseconds: 1000,
                ),
                onFinished: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (v) {
                    return PlayAzan(nxt);
                  }));
                }),
          ),//countdown
          Center(
            child: Container(
              width: 280,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        this.fajrDate,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        this.sunriseDate,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        this.dhurDate,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        this.asrDate,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        this.maghrib,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        this.issha,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ]),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/asset3.jpg'), fit: BoxFit.cover)),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    setLocationAndAdhan();
  }

  setLocationAndAdhan() async {
    setState(() {
      long = locationData.longitude;
      lat = locationData.latitude;
      setAdhan();
    });
  }

  void setAdhan() {
    this.myCoordinates = Coordinates(lat, long);
    params.madhab = Madhab.shafi;
    final prayerTimes = PrayerTimes.today(myCoordinates, params);
    this.fajrDate += DateFormat.jm().format(prayerTimes.fajr);
    this.sunriseDate += DateFormat.jm().format(prayerTimes.sunrise);
    this.dhurDate += DateFormat.jm().format(prayerTimes.dhuhr);
    this.asrDate += DateFormat.jm().format(prayerTimes.asr);
    this.maghrib += DateFormat.jm().format(prayerTimes.maghrib);
    this.issha += DateFormat.jm().format(prayerTimes.isha);
    Prayer nextPrayer = prayerTimes.nextPrayer();
    if (nextPrayer == Prayer.none) {
      //special case --> el 3shaa 5lst w el next = none
      nextPrayer = getTimeForSpecialCase(nextPrayer, prayerTimes);
      nxt = nextPrayer;
    } else {
      getTimeNormal(prayerTimes, nextPrayer);
      nxt = nextPrayer;
    }
    setNextPrayerStr(nextPrayer);
  }

  void getTimeNormal(PrayerTimes prayerTimes, Prayer nextPrayer) {
    timeForNextPrayer = prayerTimes.timeForPrayer(nextPrayer);
    secondsTillNextPrayer =
        DateTime.now().difference(timeForNextPrayer).inSeconds.toInt().abs();
  }

  Prayer getTimeForSpecialCase(Prayer nextPrayer, PrayerTimes prayerTimes) {
    final d = DateTime.now().add(Duration(hours: 5));
    final Date = DateComponents(d.year, d.month, d.day);
    final nPrayerTimes = PrayerTimes(myCoordinates, Date, params);
    nextPrayer = nPrayerTimes.nextPrayer();
    timeForNextPrayer = prayerTimes.timeForPrayer(nextPrayer);
    timeForNextPrayer.subtract(Duration(hours: 5));
    secondsTillNextPrayer = DateTime.now()
        .difference(timeForNextPrayer.add(Duration(days: 1)))
        .inSeconds
        .toInt()
        .abs();
    return nextPrayer;
  }

  void setNextPrayerStr(Prayer nextPrayer) {
    if (nextPrayer.index == 1) {
      nextPrayerStr += "fajr";
    } else if (nextPrayer.index == 2) {
      nextPrayerStr += "sunrise";
    } else if (nextPrayer.index == 3) {
      nextPrayerStr += "duhr";
    } else if (nextPrayer.index == 4) {
      nextPrayerStr += "aasr";
    } else if (nextPrayer.index == 5) {
      nextPrayerStr += "Maghrib";
    } else if (nextPrayer.index == 6) {
      nextPrayerStr += "Ishaa";
    }
  }

  double long;
  double lat;
  Coordinates myCoordinates;
  final params = CalculationMethod.egyptian.getParameters();
  String fajrDate = "Fajr : ";
  String sunriseDate = "Sunrise : ";
  String dhurDate = "Duhr : ";
  String asrDate = "Asr : ";
  String maghrib = "maghrib : ";
  String issha = "issha : ";
  String nextPrayerStr = "Next Prayer Is :  ";
  String nextPrayerTime = " ";
  int secondsTillNextPrayer = 7;
  DateTime timeForNextPrayer;
}
