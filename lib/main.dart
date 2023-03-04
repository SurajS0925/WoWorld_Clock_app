import 'package:flutter/material.dart';
import 'package:suraj_app2/pages/home.dart';
import 'package:suraj_app2/pages/loading.dart';
import 'package:suraj_app2/pages/choose_location.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
        '/': (context) => loading(),
        '/home': (context) => Home(),
        '/location': (context) => Chooselocation(),
    },
  ),
  );
}

