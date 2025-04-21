import 'package:flutter/material.dart';
import 'package:world_clock/worldTime_class.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String curr_Time = 'Loading Time';

  void setupWorldTime() async {
    print('Test from loading xd');
    WorldTime worldTime = WorldTime(
      continent: 'asia',
      city: 'kathmandu',
      flag: 'Nepal.png',
    );
    await worldTime.getTime();
    // print(worldTime.time);

    setState(() {
      curr_Time = worldTime.time;
    });
  }

  @override
  void initState() {
    //Can't use async in initState that's why a function was made above
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(curr_Time, style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}
