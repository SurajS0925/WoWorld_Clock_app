import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suraj_app2/services/World_time.dart';

class Chooselocation extends StatefulWidget {
  @override
  _ChooselocationState createState() => _ChooselocationState();
}

class _ChooselocationState extends State<Chooselocation> {

  List<Worldtime> locations =[
    Worldtime(url: 'Europe/London', loca: 'London', flag: 'uk.png', isday: false),
    Worldtime(url: 'Europe/Berlin', loca: 'Athens', flag: 'greece.png',isday: false),
    Worldtime(url: 'Africa/Cairo', loca: 'Cairo', flag: 'egypt.png',isday: false),
    Worldtime(url: 'Africa/Nairobi', loca: 'Nairobi', flag: 'kenya.png',isday: false),
    Worldtime(url: 'America/Chicago', loca: 'Chicago', flag: 'usa.png',isday: false),
    Worldtime(url: 'America/New_York', loca: 'New York', flag: 'usa.png',isday: false),
    Worldtime(url: 'Asia/Seoul', loca: 'Seoul', flag: 'south_korea.png',isday: false),
    Worldtime(url: 'Asia/Jakarta', loca: 'Jakarta', flag: 'indonesia.png',isday: false),
  ];

  void updatetime(index) async {
    Worldtime ins=locations[index];
    await ins.getTime();
    //navigate to home screen
    Navigator.pop(context, {
      'loca': ins.loca,
      'time': ins.time,
      'flag': ins.flag,
      'isday': ins.isday,
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build function run');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(itemCount: locations.length,
      itemBuilder: (context, index){
        return Padding(
            padding: EdgeInsets.symmetric(vertical: 1,horizontal: 4),
        child :Card(
          child: ListTile(
            onTap: () {
              updatetime(index);
            },
            title: Text(locations[index].loca),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/${locations[index].flag}'),
            ),
          ),
        ),
        );
      }),
    );
  }
}

