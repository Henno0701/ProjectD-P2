import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  // ignore: unused_field
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page'),
    Text('Make Reservation Page'),
    Text('View Reservations Page'),
    Text('Profile Page'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 2) {
        // Check if "View Reservations" is tapped
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ViewReservations()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Padding(
        padding: const EdgeInsets.only(
            top: 50.0, left: 20.0), // Adjust left padding as needed
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .start, // Align children to the start (left) of the row
          children: [
            const Text(
              'Welcome',
              style: TextStyle(
                color: Color(0xFF1E80ED),
                fontSize: 25,
              ),
            ),
            const Text(
              'John',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 20,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Text(
                'Quick Access',
                style: TextStyle(
                  color: Color(0xFFB0B0B0),
                  fontSize: 10,
                ),
              ),
            ),
            // Existing Quick Access buttons
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: SizedBox(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(
                        const Size(double.infinity, 55)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xFF2E2E2E),
                    ),
                  ),
                  child: const Text(
                    "Make reservation",
                    style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFFB0B0B0),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: SizedBox(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(
                        const Size(double.infinity, 55)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xFF2E2E2E),
                    ),
                  ),
                  child: const Text(
                    "Example",
                    style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFFB0B0B0),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(), // Add Spacer to push content up
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Make Reservation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'View Reservations',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF1E80ED),
        unselectedItemColor: const Color(0xFFB0B0B0),
        backgroundColor: Colors.black, // Set the background color to black
        onTap: _onItemTapped,
      ),
    );
  }
}

class ViewReservations extends StatelessWidget {
  const ViewReservations({Key? key});
  final int _currentIndex = 0;

  static const List<Widget> _tabs = [
    UpcomingReservations(),
    ExpiredReservations(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        backgroundColor: Colors.black, // Set background color to black
        appBar: AppBar(
          backgroundColor: Colors.blue, // Set app bar background color to blue
          title: const Text(
            'Reservations',
            style: TextStyle(color: Colors.white), // Set text color to white
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.calendar_month),
                child: Text(
                  'Upcoming Reservations',
                  style: TextStyle(
                    color: Colors.white, // Set tab text color to white
                  ),
                ),
              ),
              Tab(
                icon: Icon(Icons.calendar_month),
                child: Text(
                  'Expired Reservations',
                  style: TextStyle(
                    color: Colors.white, // Set tab text color to white
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: _tabs,
        ),
      ),
    );
  }
}

class ExpiredReservations extends StatelessWidget {
  const ExpiredReservations({Key? key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          child: ListTile(
            tileColor: const Color.fromARGB(255, 7, 7, 7),
            textColor: const Color.fromARGB(255, 9, 157, 226),
            iconColor: const Color.fromARGB(255, 9, 157, 226),
            leading: const Icon(Icons.date_range),
            title: const Text('Date: 12/12/2022'),
            subtitle: const Text('Location: 1234 Example St'),
            trailing: const Text('Time: 12:00 PM'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Card(
          child: ListTile(
            tileColor: const Color.fromARGB(255, 7, 7, 7),
            textColor: const Color.fromARGB(255, 9, 157, 226),
            iconColor: const Color.fromARGB(255, 9, 157, 226),
            leading: const Icon(Icons.date_range),
            title: const Text('Date: 12/12/2022'),
            subtitle: const Text('Location: 1234 Example St'),
            trailing: const Text('Time: 12:00 PM'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}

class UpcomingReservations extends StatelessWidget {
  const UpcomingReservations({Key? key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          child: ListTile(
            tileColor: const Color.fromARGB(255, 7, 7, 7),
            textColor: const Color.fromARGB(255, 9, 157, 226),
            iconColor: const Color.fromARGB(255, 9, 157, 226),
            leading: const Icon(Icons.date_range),
            title: const Text('Date: 12/12/2022'),
            subtitle: const Text('Location: 1234 Example St'),
            trailing: const Text('Time: 12:00 PM'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Card(
          child: ListTile(
            tileColor: const Color.fromARGB(255, 7, 7, 7),
            textColor: const Color.fromARGB(255, 9, 157, 226),
            iconColor: const Color.fromARGB(255, 9, 157, 226),
            leading: const Icon(Icons.date_range),
            title: const Text('Date: 12/12/2022'),
            subtitle: const Text('Location: 1234 Example St'),
            trailing: const Text('Time: 12:00 PM'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
