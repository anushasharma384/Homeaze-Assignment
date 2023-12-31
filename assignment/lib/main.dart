import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homeaze',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromRGBO(7, 147, 197, 1)),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Homeaze'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required String title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _showTimePicker1() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _timeOfDay1 = value!;
      });
    });
  }

  void _showTimePicker2() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _timeOfDay2 = value!;
      });
    });
  }

  void _showTimePicker3() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _timeOfDay3 = value!;
      });
    });
  }

  void _showTimePicker4() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _timeOfDay4 = value!;
      });
    });
  }

  TimeOfDay _timeOfDay1 = TimeOfDay(hour: 8, minute: 30);
  TimeOfDay _timeOfDay2 = TimeOfDay(hour: 2, minute: 30);
  TimeOfDay _timeOfDay3 = TimeOfDay(hour: 3, minute: 30);
  TimeOfDay _timeOfDay4 = TimeOfDay(hour: 4, minute: 30);

  int _value = 1;
  bool mon = false;
  bool tues = false;
  bool wed = false;
  bool thu = false;
  bool fri = false;
  bool sat = false;
  bool sun = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 0.1,
              width: double.infinity,
              color: Colors.white,
            ),
            Text(
              "Outlet Type and Timings",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 26),
            ),
            Container(
              height: height * 0.01,
              width: double.infinity,
              color: Colors.white,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 20),
              child: Row(
                children: [
                  Text(
                    "Outlet Type",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
                left: 23,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value!;
                          });
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Delivery Boy Available",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.black),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 2,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value!;
                          });
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Delivery Boy Not Available",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.black),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  Image.asset(
                    "assets/Images/abc.png",
                    height: 15,
                    width: 16,
                  ),
                  Text(
                    "Sorry! Currently we are not catering to these outlets.",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontStyle: FontStyle.italic),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 20),
              child: Row(
                children: [
                  Text(
                    "Outlet Operational Hours",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 15, bottom: 10),
              child: Row(
                children: [
                  Text(
                    "Enter Outlet open and close hours",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 15, left: 40, right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 60,
                    width: 122,
                    child: ElevatedButton(
                        onPressed: _showTimePicker1,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shadowColor: Color.fromRGBO(221, 223, 226, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Opens At ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(191, 191, 192, 1)),
                                ),
                                Text(
                                  "*",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                )
                              ],
                            ),
                            Text(
                              _timeOfDay1.format(context).toString(),
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(191, 191, 192, 1)),
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 60,
                    width: 122,
                    child: ElevatedButton(
                        onPressed: _showTimePicker2,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shadowColor: Color.fromRGBO(221, 223, 226, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Closes At ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(191, 191, 192, 1)),
                                ),
                                Text(
                                  "*",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                )
                              ],
                            ),
                            Text(
                              _timeOfDay2.format(context).toString(),
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(191, 191, 192, 1)),
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 15, left: 40, right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 60,
                    width: 122,
                    child: ElevatedButton(
                        onPressed: _showTimePicker3,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shadowColor: Color.fromRGBO(221, 223, 226, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Opens At ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(191, 191, 192, 1)),
                                ),
                                Text(
                                  "*",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                )
                              ],
                            ),
                            Text(
                              _timeOfDay3.format(context).toString(),
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(191, 191, 192, 1)),
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 60,
                    width: 122,
                    child: ElevatedButton(
                        onPressed: _showTimePicker4,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shadowColor: Color.fromRGBO(221, 223, 226, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Closes At ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(191, 191, 192, 1)),
                                ),
                                Text(
                                  "*",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                )
                              ],
                            ),
                            Text(
                              _timeOfDay4.format(context).toString(),
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(191, 191, 192, 1)),
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 20),
              child: Row(
                children: [
                  Text(
                    "Mark Open Days",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 15, bottom: 10),
              child: Row(
                children: [
                  Text(
                    "Do not forget to uncheck your OFF Days!",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 15, left: 35, right: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: mon,
                        onChanged: (value) {
                          setState(() {
                            mon = value!;
                          });
                        },
                        activeColor: Color.fromRGBO(7, 147, 197, 1),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Monday",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: tues,
                        onChanged: (value) {
                          setState(() {
                            tues = value!;
                          });
                        },
                        activeColor: Color.fromRGBO(7, 147, 197, 1),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Tuesday",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: wed,
                        onChanged: (value) {
                          setState(() {
                            wed = value!;
                          });
                        },
                        activeColor: Color.fromRGBO(7, 147, 197, 1),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Wednesday",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: thu,
                        onChanged: (value) {
                          setState(() {
                            thu = value!;
                          });
                        },
                        activeColor: Color.fromRGBO(7, 147, 197, 1),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Thursday",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: fri,
                        onChanged: (value) {
                          setState(() {
                            fri = value!;
                          });
                        },
                        activeColor: Color.fromRGBO(7, 147, 197, 1),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Friday",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: sat,
                        onChanged: (value) {
                          setState(() {
                            sat = value!;
                          });
                        },
                        activeColor: Color.fromRGBO(7, 147, 197, 1),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Saturday",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: sun,
                        onChanged: (value) {
                          setState(() {
                            sun = value!;
                          });
                        },
                        activeColor: Color.fromRGBO(7, 147, 197, 1),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Sunday",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
              width: width * 0.85,
              child: ElevatedButton(
                onPressed: () async{
                  await FirebaseFirestore.instance.collection('users').add({
                    'openAt1': _timeOfDay1.toString(),
                    'openAt2': _timeOfDay3.toString(),
                    'closeAt1': _timeOfDay2.toString(),
                    'closeAt2': _timeOfDay4.toString(),
                    'value': _value,
                    'mon': mon,
                    'tue': tues,
                    'wed': wed,
                    'thu': thu,
                    'fri': fri,
                    'sat': sat,
                    'sun': sun

                  });
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 18, 167, 222),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: const Text(
                  "Next",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.1,
              width: double.infinity,
            )
          ],
        ),
      ),
    );
  }
}
