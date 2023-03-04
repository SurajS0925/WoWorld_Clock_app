import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:suraj_app2/services/World_time.dart';


class loading extends StatefulWidget {
  const loading({Key? key}) : super(key: key);
  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading>{


    void setupWorldTime () async{
    Worldtime ins= Worldtime(loca: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin', isday: true ,);
    await ins.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location': ins.loca,
      'time': ins.time,
      'flag': ins.flag,
      'isday': ins.isday,
    });
    }
  int cou=0;

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.blue[600],
        body: Center(
          child:
          SpinKitSpinningCircle(
          color: Colors.white,
          size: 50.0,
          ),
    ),
  );
  }
}
