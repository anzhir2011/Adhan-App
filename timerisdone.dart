import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

Prayer nextPrayer;

class PlayAzan extends StatefulWidget {
  PlayAzan(Prayer x)
  {
    nextPrayer=x;
  }
  @override
  _PlayAzanState createState() => _PlayAzanState();
}

class _PlayAzanState extends State<PlayAzan> {
  AudioPlayer audioPlayer=AudioPlayer();
  AssetImage img;
  int result;
  bool isPlaying=true;
  Icon ic=Icon(Icons.pause_circle_filled , color: Colors.blue,);


  @override
  void initState() {
    if(nextPrayer==Prayer.sunrise)
       {
         img=AssetImage('assets/shrouq.jpg');
       }
     else if(nextPrayer==Prayer.fajr)
       {
         img=AssetImage('assets/fajr.jpg');
       }
     else if(nextPrayer==Prayer.dhuhr)
     {
       img=AssetImage('assets/zuhr.jpg');
     }
     else if(nextPrayer==Prayer.asr)
     {
       img=AssetImage('assets/aasr.jpg');
     }
     else if(nextPrayer==Prayer.maghrib)
     {
       img=AssetImage('assets/maghrib.jpg');
     }
     else
       {
         img=AssetImage('assets/ishaa.jpg');
       }
     playLocal() async
    {

      int result = await new AudioPlayer().play('assets/audios/azan.mp3', isLocal: true);

    }
    setState(() {

  playLocal();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      padding: EdgeInsets.only(top: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [IconButton(iconSize: 70,icon: ic, onPressed: (){
        setState(() {

          if(isPlaying==true)
            {
             audioPlayer.pause();
              ic=Icon(Icons.play_circle_fill,color: Colors.blue);
            }
          else{
           audioPlayer.resume();
            ic=Icon(Icons.pause_circle_filled , color: Colors.blue,);
          }
          isPlaying=!isPlaying;
        });
        },)],
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: img, fit: BoxFit.cover)),
    ),
    );
  }
}
