import 'package:flutter/material.dart';
import 'package:world_clock/screens/home.dart';
import 'package:world_clock/misc/worldTime_class.dart';
import 'package:world_clock/misc/locations_list.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  final TextEditingController _searchController = TextEditingController();
  List<WorldTime> filteredLocations = [];

  @override
  void initState() {
    super.initState();
    print("Total locations: ${locations.length}"); // Debug line
    filteredLocations = locations;
    _searchController.addListener(_filterLocations);
  }

  void _filterLocations() {
    setState(() {
      filteredLocations =
          locations
              .where(
                (location) => location.city.toLowerCase().contains(
                  _searchController.text.toLowerCase(),
                ),
              )
              .toList();
    });
  }

  void setTime(index) async {
    WorldTime temp = filteredLocations[index];
    await temp.getTime();
    Navigator.pop(context, {
      'time': temp.time,
      'continent': temp.continent,
      'city': temp.city,
      'flag': temp.flag,
      'isDayTime': temp.isDayTime,
      'isEveningTime': temp.isEveningTime,
      'isMorningTime': temp.isMorningTime,
      'isNightTime': temp.isNightTime,
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.grey, Colors.blueGrey],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: TextField(
          controller: _searchController,
          style: TextStyle(color: Colors.white70),
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.black45),
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Colors.white70),
            suffixIcon: IconButton(
              onPressed: () {
                _searchController.clear();
              },
              icon: Icon(Icons.clear, color: Colors.white70),
            ),
            contentPadding: EdgeInsets.only(top: 12),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Padding(
            //   padding: EdgeInsets.all(20),
            //   child: Center(
            //     child: Text(
            //       'Choose Location',
            //       style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            //     ),
            //   ),
            // ),
            // Divider(thickness: 2, indent: 20, endIndent: 20),
            Expanded(
              child: ListView.builder(
                itemCount: filteredLocations.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        setTime(index);
                        // Navigator.pop(context);
                      },
                      title: Text(capitalize(filteredLocations[index].city)),
                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black45, width: 1),
                        ),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                            'assets/flags/${filteredLocations[index].flag}',
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // SizedBox(height: 30),
            // TextButton.icon(
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            //   label: Text(
            //     'Go BACK!',
            //     style: TextStyle(color: Colors.black87, fontSize: 20),
            //   ),
            //   icon: Icon(Icons.arrow_left, color: Colors.black87, size: 25),
            // ),
          ],
        ),
      ),
    );
  }
}
