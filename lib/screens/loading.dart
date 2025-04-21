import 'package:flutter/material.dart';
import 'package:world_clock/misc/worldTime_class.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime worldTime = WorldTime(
      continent: 'asia',
      city: 'kathmandu',
      flag: 'Nepal.png',
    );
    await worldTime.getTime();

    if (!mounted) return;

    Navigator.pushReplacementNamed(
      context,
      '/home',
      arguments: {
        'time': worldTime.time,
        'continent': worldTime.continent,
        'city': worldTime.city,
        'flag': worldTime.flag,
        'isDayTime': worldTime.isDayTime,
        'isEveningTime': worldTime.isEveningTime,
        'isMorningTime': worldTime.isMorningTime,
        'isNightTime': worldTime.isNightTime,
      },
    );
    // print(worldTime.time);
    //
    // setState(() {
    //   curr_Time = worldTime.time;
    // });
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
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Loading..',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SpinKitFadingCircle(color: Colors.black45, size: 70),
          ],
        ),
      ),
    );
  }
}
