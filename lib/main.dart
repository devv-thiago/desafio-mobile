import 'package:flutter/material.dart';

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
      color: Color.fromRGBO(31, 31, 31, 1),
      height: deviceInfo.height,
      width: deviceInfo.width,
      child: Column(
        children: [
          Row(
            
            children: [
              SearchBar(
                backgroundColor: WidgetStateProperty.all(Colors.white),
                hintText: 'Pesquisar por títulos',
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite_border),
              ),
            ],
          ),
          Container(
            color: Colors.amber,
          ),
        ],
      ),
    );
  }
}
