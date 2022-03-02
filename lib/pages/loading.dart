import 'dart:convert';
import 'package:flutter_youtube/pages/services/WorldTime.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'Loading ...';
  void setTimeInstance() async {
    WorldTime timeInstance = WorldTime(location: 'Addis Ababa', flag: 'Ethiopia.png', uri: 'Africa/Addis_Ababa');
    await timeInstance.getTime();
    Navigator.pushReplacementNamed(context,'/home',arguments: {
      "location": timeInstance.location,
      "flag" : timeInstance.flag,
      "time" : timeInstance.time,
      "isDay" : timeInstance.isDay,
    });
  }

  @override
  void initState(){
    super.initState();
    setTimeInstance();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blue[900],
      body: const Center(
        child: SpinKitSpinningLines(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}

