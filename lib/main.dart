import 'package:flutter/material.dart';
import 'package:movie_app/ui/homepage/homepage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    MaterialApp(
      home: Scaffold(
        body: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size deviceInfo = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.only(
          top: deviceInfo.width * 0.1,
        ),
        color: Color.fromRGBO(31, 31, 31, 1),
        height: deviceInfo.height,
        width: deviceInfo.width,
        child: Homepage());
  }
}
