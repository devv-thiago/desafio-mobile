import 'package:flutter/material.dart';
import 'package:movie_app/ui/homepage/widgets/catalog.dart';

void main() {
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
        left: deviceInfo.width * 0.05,
        right: deviceInfo.width * 0.05,
        top: deviceInfo.width * 0.05,
      ),
      color: Color.fromRGBO(31, 31, 31, 1),
      height: deviceInfo.height,
      width: deviceInfo.width,
      child: Column(
        spacing: deviceInfo.height * 0.05,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 1,
                child: SearchBar(
                  backgroundColor: WidgetStateProperty.all(Colors.white),
                  hintText: 'Pesquisar por títulos',
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border,
                  size: 30,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          Catalog(
            height: deviceInfo.height * 0.8,
          ),
        ],
      ),
    );
  }
}
