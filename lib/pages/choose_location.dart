import 'package:flutter/material.dart';
import 'package:flutter_youtube/pages/services/WorldTime.dart';
class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(uri: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(uri: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(uri: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(uri: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(uri: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(uri: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(uri: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(uri: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];
  void updateTime(index) async{
    WorldTime instance  = locations[index];
    await instance.getTime();
    Navigator.pop(context,{
      'location': instance.location,
      'time':instance.time,
      'isDay': instance.isDay,
      // 'uri': instance.uri
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Location'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 5.0),
              child: Card(
                child: ListTile(
                  onTap: () async {
                      updateTime(index);
                    },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          },
          ),
    );
  }
}
