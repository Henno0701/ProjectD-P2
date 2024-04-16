import 'dart:ui';
import 'dart:io';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:html' as html;
import 'package:flutter/foundation.dart' show kIsWeb;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

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
    });

    switch (index) {
      case 0:
        // Navigate to Home Page
        break;
      case 1:
        // Navigate to Make Reservation Page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MakeReservations()),
        );
        break;
      case 2:
        // Navigate to View Reservations Page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ViewReservations()),
        );
        break;
      case 3:
        // Navigate to Profile Page
        break;
    }
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

// ignore: must_be_immutable
class ViewReservations extends StatefulWidget {
  const ViewReservations({Key? key});

  @override
  _ViewReservationsState createState() => _ViewReservationsState();
}

class _ViewReservationsState extends State<ViewReservations> {
  int _currentIndex = 0;

  static final List<Widget> _tabs = [
    UpcomingReservations(
      upcomingReservations: [
        Reservation(
          date: '2024-12-12',
          location: '1234 Example St',
          time: '12:00',
        ),
        Reservation(
          date: '2022-12-13',
          location: '1234 Example St',
          time: '12:00',
        ),
        Reservation(
          date: '2022-12-14',
          location: '1234 Example St',
          time: '12:00',
        ),
      ],
    ),
    ExpiredReservations(
      expiredReservations: [
        Reservation(
          date: '12/12/2022',
          location: '1234 Example St',
          time: '12:00',
        ),
        Reservation(
          date: '12/13/2022',
          location: '1234 Example St',
          time: '12:00',
        ),
        Reservation(
          date: '12/14/2022',
          location: '1234 Example St',
          time: '12:00',
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Reservations',
            style: TextStyle(color: Colors.white), // Set text color to white
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.calendar_today),
                text: 'Upcoming Reservations',
              ),
              Tab(
                icon: Icon(Icons.history),
                text: 'Expired Reservations',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: _tabs,
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
          currentIndex: _currentIndex,
          selectedItemColor: const Color(0xFF1E80ED),
          unselectedItemColor: const Color(0xFFB0B0B0),
          backgroundColor: Colors.black, // Set the background color to black
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              // Handle navigation to other pages if needed
              // This is just to maintain the selected index
            });
          },
        ),
      ),
    );
  }
}

void setState(Null Function() param0) {}

class Reservation {
  final String date;
  final String location;
  final String time;

  Reservation({
    required this.date,
    required this.location,
    required this.time,
  });
}

class ExpiredReservations extends StatelessWidget {
  final List<Reservation> expiredReservations;

  const ExpiredReservations({Key? key, required this.expiredReservations})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expiredReservations.length,
      itemBuilder: (context, index) {
        final reservation = expiredReservations[index];
        return Card(
          child: ListTile(
            tileColor: const Color.fromARGB(255, 7, 7, 7),
            textColor: const Color.fromARGB(255, 9, 157, 226),
            iconColor: const Color.fromARGB(255, 9, 157, 226),
            leading: const Icon(Icons.date_range),
            title: Text('Date: ${reservation.date}'),
            subtitle: Text('Location: ${reservation.location}'),
            trailing: Text('Time: ${reservation.time}'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
    );
  }
}

class UpcomingReservations extends StatefulWidget {
  final List<Reservation> upcomingReservations;

  const UpcomingReservations({
    Key? key,
    required this.upcomingReservations,
  }) : super(key: key);

  @override
  _UpcomingReservationsState createState() => _UpcomingReservationsState();
}

class _UpcomingReservationsState extends State<UpcomingReservations> {
  late List<Reservation> _filteredReservations;

  @override
  void initState() {
    super.initState();
    _filteredReservations = List.from(widget.upcomingReservations);
    removeExpiredReservations();
  }

  void removeExpiredReservations() {
    final currentTime = DateTime.now();

    _filteredReservations.removeWhere((reservation) {
      final reservationDateTime = DateTime.parse(
          '${reservation.date} ${reservation.time}'); // Convert date and time strings to DateTime object
      return reservationDateTime.isBefore(currentTime);
    });

    setState(() {}); // Update the UI after removing expired reservations
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _filteredReservations.length,
      itemBuilder: (context, index) {
        final reservation = _filteredReservations[index];
        return Card(
          child: ListTile(
            tileColor: const Color.fromARGB(255, 7, 7, 7),
            textColor: const Color.fromARGB(255, 9, 157, 226),
            iconColor: const Color.fromARGB(255, 9, 157, 226),
            leading: const Icon(Icons.date_range),
            title: Text('Date: ${reservation.date}'),
            subtitle: Text('Location: ${reservation.location}'),
            trailing: Text('Time: ${reservation.time}'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
    );
  }
}

class MakeReservations extends StatefulWidget {
  MakeReservations({Key? key});

  @override
  _MakeReservationsState createState() => _MakeReservationsState();
}

class _MakeReservationsState extends State<MakeReservations> {
  int _selectedIndex = 0;
  // ignore: unused_field
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page'),
    Text('Make Reservation Page'),
    Text('View Reservations Page'),
    Text('Profile Page'),
  ];
  static const List<Widget> _tabs = [
    OverviewReservations(),
    ReserveReservations(),
    QuickReserveReservations(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
        // Check if "Make Reservation" is tapped
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MakeReservations()),
        );
      } else if (_selectedIndex == 2) {
        // Check if "View Reservations" is tapped
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ViewReservations()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        backgroundColor: Colors.black, // Set background color to black
        appBar: AppBar(
          backgroundColor: Colors.black, // Set app bar background color to blue
          title: const Text(
            'Make Reservations',
            style: TextStyle(color: Colors.white), // Set text color to white
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.calendar_month),
                child: Text(
                  'Overview',
                  style: TextStyle(
                    color: Colors.white, // Set tab text color to white
                  ),
                ),
              ),
              Tab(
                icon: Icon(Icons.calendar_month),
                child: Text(
                  'Reserve',
                  style: TextStyle(
                    color: Colors.white, // Set tab text color to white
                  ),
                ),
              ),
              Tab(
                icon: Icon(Icons.calendar_month),
                child: Text(
                  'Quick Reserve',
                  style: TextStyle(
                    color: Colors.white, // Set tab text color to white
                  ),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: _tabs,
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
      ),
    );
  }
}

class OverviewReservations extends StatelessWidget {
  const OverviewReservations({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 20.0), // Add spacing from the top
        Row(
          children: <Widget>[
            Expanded(
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1000), // Rounded edges
                ),
                child: Container(
                  height: 150.0,
                  color: const Color.fromARGB(255, 34, 33, 33),
                  child: const Center(
                    child: Text(
                      'Available Stations: 5',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color.fromARGB(255, 248, 248, 248),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20.0), // Add spacing between cards
            Expanded(
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1000), // Rounded edges
                ),
                child: Container(
                  height: 150.0,
                  color: const Color.fromARGB(255, 34, 33, 33),
                  child: const Center(
                    child: Text(
                      'Defect Stations: 5',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color.fromARGB(255, 248, 248, 248),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
            height: 20.0), // Add spacing between the two rows of cards
        Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1000), // Rounded edges
          ),
          child: Container(
            height: 150.0,
            color: const Color.fromARGB(255, 34, 33, 33),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Defect Charging Stations\n\n\nIve got a defect station.',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Color.fromARGB(255, 248, 248, 248),
                  ),
                ),
                SizedBox(height: 10.0), // Add spacing between title and text
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ReserveReservations extends StatelessWidget {
  const ReserveReservations({Key? key});

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
            title: const Text('Feb 1-7'),
            //create 7 buttons for each day of the week
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                for (var i = 0; i < 7; i++)
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF2E2E2E),
                      ),
                    ),
                    child: Text((i + 1).toString()),
                  ),
              ],
            ),
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

class QuickReserveReservations extends StatefulWidget {
  const QuickReserveReservations({Key? key});

  @override
  _QuickReserveReservationsState createState() =>
      _QuickReserveReservationsState();
}

class _QuickReserveReservationsState extends State<QuickReserveReservations> {
  late String apiToken = '';

  Future<void> saveApiDataToJson(String responseBody) async {
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      File file = File('$appDocPath/APIdata.json');
      await file.writeAsString(responseBody);
    } catch (error) {
      print('Error saving API data to JSON file: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAlbum().then((response) {
      print(response.body); // Print response body to the terminal
      saveApiDataToJson(response.body).then((_) {
        setState(() {
          apiToken = response.body; // Update apiToken state with API response
        });
      }).catchError((error) {
        print('Error saving API data to JSON file: $error');
      });
    }).catchError((error) {
      print('Error fetching album: $error'); // Print error if any occurs
    });
  }

  Future<http.Response> fetchAlbum() {
    return http.get(Uri.parse(
        'https://schubergphilis.workflows.okta-emea.com/api/flo/d71da429cdb215bef89ffe6448097dee/invoke?clientToken=01d762901510b3c7f422595fa18d8d7bd71c1f3e58ad860fd3ae2d0c87a80955&url=/poi/v1/locations&method=GET&locationsVisibilityScopes=ACCOUNTS_STATIONS'));
  }

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
            leading: const Icon(Icons.api),
            title: const Text('API Token'),
            subtitle: Text('Token: $apiToken'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
