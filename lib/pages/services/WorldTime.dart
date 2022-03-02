import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime {
  String location;
  String uri;
  String time = 'Loading ...';
  String flag;
  bool isDay = true;

  WorldTime({required this.location,required this.flag,required this.uri});

  Future<void> getTime() async {
    try{
    Response response = await get(
        Uri.parse("http://worldtimeapi.org/api/timezone/$uri"));

    Map date = jsonDecode(response.body);
    // print(response.body);
    String dateTime = date['datetime'];
    String utcOffset = date['utc_offset'];

    DateTime now = DateTime.parse(dateTime);
    int addThis = int.parse(utcOffset.substring(1, 3));
    now = now.add(Duration(hours: addThis));

    time = DateFormat.jm().format(now);
    print(now.hour);
    isDay = now.hour > 0 && now.hour < 12 ? true : false;
    }
    catch(e){
      print(e.toString());
      time = "Couldn't load the time!";
    }

  }
}