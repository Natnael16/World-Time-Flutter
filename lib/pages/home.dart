import 'dart:convert';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  dynamic data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isEmpty ? ModalRoute.of(context)?.settings.arguments :data;


    String isDay = data['isDay'] ? 'dayTime.png' : 'nightTime.png';
  // print(data);
    return  Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$isDay'),
                  fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: [
              TextButton.icon(
                  onPressed: () async {
                dynamic result = await Navigator.pushNamed(context, '/location');
                setState(() {
                  data = {
                    'time':result['time'],
                    'location':result['location'],
                    'isDay': result['isDay']
                  };
                });
              },
                  icon: const Icon(Icons.edit_location) ,
                  label:  const Text('Choose Location',style: TextStyle(color: Colors.white, fontSize: 20),),

              ),
                const SizedBox(height: 50.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data['location'],
                      style: const TextStyle(fontSize: 24.0,letterSpacing: 2.0,color: Colors.white,

                    ),
                    ),
                  ],

                ),
                SizedBox(height: 20.0,),

                Text(data['time'],
                  style:  const TextStyle(fontSize: 50.0,letterSpacing: 2.0,color: Colors.white),),

            ],
    ),
          ),
        ),
    );
  }
}
