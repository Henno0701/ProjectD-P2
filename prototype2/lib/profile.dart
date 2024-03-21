import 'dart:html';
import 'dart:ui';
import 'dart:async';
import 'home.dart';
import 'profile.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Profile extends StatelessWidget{
  const Profile({super.key});
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: "Profile",
      home: Scaffold(
        backgroundColor: const Color(0xFF121212),
        body: Padding(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            children: [
              const Text(
                "Profile",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                    child: ElevatedButton(
                      onPressed: null,
                      style: ButtonStyle(
                        minimumSize: const MaterialStatePropertyAll(Size(double.infinity, 90)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                        backgroundColor: const MaterialStatePropertyAll(Color(0xFF1E1E1E))
                      ),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Henno Passchier",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 255, 255, 255),
                          )
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Account settings",
                        style: TextStyle(color: Color(0xFF7C7C7C)),
                      ),
                      const SizedBox(height: 5),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Home()),
                          );
                        },
                        style: const ButtonStyle(
                            minimumSize: MaterialStatePropertyAll(
                                Size(double.infinity, 55)),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0),
                            ),)),
                            backgroundColor: MaterialStatePropertyAll(
                                Color(0xFF1E1E1E))),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Account",
                            style: TextStyle(
                                color: Color(0xFFB0B0B0)),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: null,
                        style: ButtonStyle(
                            minimumSize: const MaterialStatePropertyAll(
                                Size(double.infinity, 55)),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0))),
                            backgroundColor: const MaterialStatePropertyAll(
                                Color(0xFF1E1E1E))),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Contact details",
                            style: TextStyle(
                                color: Color(0xFFB0B0B0)),
                          ),
                        ),
                      ),
                      const ElevatedButton(
                        onPressed: null,
                        style: ButtonStyle(
                            minimumSize: MaterialStatePropertyAll(
                                Size(double.infinity, 55)),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0),
                            ),)),
                            backgroundColor: MaterialStatePropertyAll(
                                Color(0xFF1E1E1E))),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Security",
                            style: TextStyle(
                                color: Color(0xFFB0B0B0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "App settings",
                        style: TextStyle(color: Color(0xFF7C7C7C)),
                      ),
                      const SizedBox(height: 5),
                      ElevatedButton(
                        onPressed: null,
                        style: const ButtonStyle(
                            minimumSize: MaterialStatePropertyAll(
                                Size(double.infinity, 55)),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0),
                            ),)),
                            backgroundColor: MaterialStatePropertyAll(
                                Color(0xFF1E1E1E))),
                        child: Row(
                          children: [
                            const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Example",
                            style: TextStyle(
                                color: Color(0xFFB0B0B0)),
                              ),
                            ),
                            Expanded( // Use Expanded to push the Switch widget to the right
                              child: Align(
                                alignment: Alignment.centerRight, // Align the Switch widget to the right
                                child: Transform.scale(
                                  scale: 0.7,
                                  child: const SwitchExample(),
                                ),
                              ),
                            ),
                          ],
                        )
                      ),
                      ElevatedButton(
                        onPressed: null,
                        style: ButtonStyle(
                            minimumSize: const MaterialStatePropertyAll(
                                Size(double.infinity, 55)),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0))),
                            backgroundColor: const MaterialStatePropertyAll(
                                Color(0xFF1E1E1E))),
                        child: Row(
                          children: [
                            const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Example",
                            style: TextStyle(
                                color: Color(0xFFB0B0B0)),
                              ),
                            ),
                            Expanded( // Use Expanded to push the Switch widget to the right
                              child: Align(
                                alignment: Alignment.centerRight, // Align the Switch widget to the right
                                child: Transform.scale(
                                  scale: 0.7,
                                  child: const SwitchExample(),
                                ),
                              ),
                            ),
                          ],
                        )
                      ),
                      ElevatedButton(
                        onPressed: null,
                        style: const ButtonStyle(
                            minimumSize: MaterialStatePropertyAll(
                                Size(double.infinity, 55)),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0),
                            ),)),
                            backgroundColor: MaterialStatePropertyAll(
                                Color(0xFF1E1E1E))),
                        child: Row(
                          children: [
                            const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Example",
                            style: TextStyle(
                                color: Color(0xFFB0B0B0)),
                              ),
                            ),
                            Expanded( // Use Expanded to push the Switch widget to the right
                              child: Align(
                                alignment: Alignment.centerRight, // Align the Switch widget to the right
                                child: Transform.scale(
                                  scale: 0.7,
                                  child: const SwitchExample(),
                                ),
                              ),
                            ),
                          ],
                        )
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    final MaterialStateProperty<Color?> trackColor =
        MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        // Track color when the switch is selected.
        if (states.contains(MaterialState.selected)) {
          return const Color(0xFF1E80ED);
        }

        // Otherwise return null to set default track color
        // for remaining states such as when the switch is
        // hovered, focused, or disabled.
        return const Color(0xFF515151);
      },
    );

    return Switch(
      // This bool value toggles the switch.
      value: light,
      trackColor: trackColor,
      thumbColor: const MaterialStatePropertyAll<Color>(Colors.white),
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          light = value;
        });
      },
    );
  }
}
