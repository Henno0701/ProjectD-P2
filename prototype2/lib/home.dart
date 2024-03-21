import 'dart:html';
import 'dart:ui';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Home extends StatelessWidget{
  final bool hasReservation;
  const Home({super.key, this.hasReservation = true});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFF121212),
        body: Padding(
          padding: const EdgeInsets.only(top: 90.0, left: 20.0, right: 20.0), // Adjust left padding as needed
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start (left) of the row
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
              if (hasReservation)
              Padding(
                padding: const EdgeInsets.only(top: 10,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Car Status',
                      style: TextStyle(
                        color: Color(0xFFB0B0B0),
                        fontSize: 12,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: ElevatedButton(
                                onPressed: null,
                                style: ButtonStyle(
                                  backgroundColor: const MaterialStatePropertyAll(Color(0xFF2E2E2E)),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                  ),
                                  minimumSize: MaterialStateProperty.all(const Size(double.infinity, 70)), // Change the height here
                                ),
                                  child: const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Battery",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color.fromARGB(255, 255, 255, 255),
                                      ),
                                    ),
                                  ),
                              ),
                            ),
                          const SizedBox(width: 20),
                          Expanded(
                              child: ElevatedButton(
                                onPressed: null,
                                style: ButtonStyle(
                                  backgroundColor: const MaterialStatePropertyAll(Color(0xFF2E2E2E)),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                  ),
                                  minimumSize: MaterialStateProperty.all(const Size(double.infinity, 70)),
                                ),
                                  child: const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Timer",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color.fromARGB(255, 255, 255, 255),
                                      ),
                                    ),
                                  ), 
                                ),
                              ),
                          ],
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                          child: ElevatedButton(
                            onPressed: null,
                            style: ButtonStyle(
                              backgroundColor: const MaterialStatePropertyAll(Color(0xFF2E2E2E)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                  ),
                              minimumSize: MaterialStateProperty.all(const Size(double.infinity, 90)),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(top: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      "Info",
                                      style: TextStyle(
                                        color: Color(0xFFB0B0B0),
                                        fontSize: 12,
                                        ),
                                      )
                                    ),
                                  Row(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Charging Station:",
                                              style: TextStyle(
                                                  color: Color(0xFFB0B0B0),
                                                  fontSize: 12,
                                                ),
                                              ),
                                            Text(
                                              "Charging KW:",
                                              style: TextStyle(
                                                color: Color(0xFFB0B0B0),
                                                fontSize: 12,
                                                ),
                                              ),
                                            Text(
                                              "License Plate:",
                                              style: TextStyle(
                                                  color: Color(0xFFB0B0B0),
                                                  fontSize: 12,
                                                ),
                                              )
                                          ]
                                        )
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 30,),
                                        child:  Align(
                                          alignment: Alignment.centerLeft,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("LP-01A",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color.fromARGB(255, 255, 255, 255),
                                              )),
                                              Text("150 KW",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color.fromARGB(255, 255, 255, 255),
                                              )),
                                              Text("XN-OA2-B2",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color.fromARGB(255, 255, 255, 255),
                                              ))
                                              ],
                                            )
                                          )
                                      )
                                    ],
                                ),
                                ]
                              ),
                              ),
                          )
                        )
                  ],
                )
              )
              ,
              const Padding(
                padding: EdgeInsets.only(top: 15.0,),
                child: Text(
                  'Quick Access',
                  style: TextStyle(
                    color: Color(0xFFB0B0B0),
                    fontSize: 12,
                  ),
                ),
              ),
              Padding(
              padding: const EdgeInsets.only(top: 8.0,),
              child: SizedBox(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 70)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    backgroundColor: const MaterialStatePropertyAll(Color(0xFF2E2E2E)),
                  ),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Make reservation",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFFB0B0B0),
                      )
                    ),
                  ),
                  ),
                ),
              ),
              Padding(
              padding: const EdgeInsets.only(top: 5.0,),
              child: SizedBox(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 70)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    backgroundColor: const MaterialStatePropertyAll(Color(0xFF2E2E2E))
                  ),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Example",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFFB0B0B0),
                      )
                    ),
                  ),
                  ),
                ),
              ),
              ],
            ),
          )
        ),
    );
  }
}