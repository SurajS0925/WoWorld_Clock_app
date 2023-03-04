import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';


class Worldtime{

  late String loca ; //location name for ui
  late String time; //time in that location
  late String flag; //url to asset flag icon
  late String url; //location url
  late bool isday;

  Worldtime({required this.loca,required this.flag,required this.url, required this.isday});


  Future <void> getTime() async {

    final response = await http.get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
    Map data=jsonDecode(response.body);
    //print(data);
    //get properties from data
    String datetime=data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    //print(datetime);
    //print(offset);

    //create a date time object
    DateTime t=DateTime.parse(datetime);
    t=t.add(Duration(hours: int.parse(offset)));
    print(t);
    isday = t.hour >=6 && t.hour < 20 ? true: false;
    print(isday);
    time=DateFormat.jm().format(t);
    print(time);
  }


}

