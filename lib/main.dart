
import 'package:flutter/material.dart';
import 'package:flutter_youtube/pages/home.dart';
import 'package:flutter_youtube/pages/loading.dart';
import 'package:flutter_youtube/pages/choose_location.dart';

void main() => runApp( MaterialApp(
  // home: Home(),
  initialRoute: '/',
  routes: {
    '/' : (context) => const Loading(),
    '/home': (context) => Home(),
    '/location' : (context) => const ChooseLocation(),

  },
));
