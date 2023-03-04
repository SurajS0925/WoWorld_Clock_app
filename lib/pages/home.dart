import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/basic.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data= {};

  @override
  Widget build(BuildContext context) {

    data=data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;
    print(data);

    //set background
    String bgImage = data['isday'] ? 'day.jpg' : 'nig.jpg';

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120,0, 0),
            child: Column(
                children: [
                  ElevatedButton(onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data={
                        'time':result['time'],
                        'location': result['loca'],
                        'isday': result['isday'],
                        'flag': result['flag']
                      };
                    });
                  },
                      child:
                          Text('Click here to edit location')),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          data['location'],
                          style: TextStyle(
                            fontSize: 28,
                            letterSpacing: 2,
                            fontStyle: FontStyle.italic,
                            color: Colors.black87,
                          ),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 60,
                      color: Colors.red
                    ),
                  )
                ],
            ),
          ),
        ),
      )
    );
  }
}

