import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';

class MovieMiniature extends StatelessWidget {
  final String movieTitle, image, releaseDate;
  final double width;

  const MovieMiniature.title({
    this.releaseDate = '',
    required this.width,
    required this.movieTitle,
    super.key,
  }) : image = '';

  const MovieMiniature.image({
    required this.width,
    required this.releaseDate,
    required this.image,
    super.key,
  }) : movieTitle = '';

  @override
  Widget build(BuildContext context) {
    return movieTitle.isNotEmpty
        ? Container(
            margin: EdgeInsets.only(
              right: 10,
              left: 10,
            ),
            width: width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1),
              gradient: LinearGradient(
                colors: [
                  Colors.blue[200]!,
                  Colors.blue[500]!,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              color: Colors.blue[200],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              movieTitle,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 18,
              ),
            ),
          )
        : Container(
            decoration: BoxDecoration(),
            width: width,
            child: Column(
              children: [
                SizedBox(
                  height: 250,
                  child: Image.network(fit: BoxFit.fill, image, headers: {
                    "accept": "application/json",
                    "Authorization": "Bearer ${dotenv.env['API_KEY']}"
                  }),
                ),
                Container(
                  alignment: Alignment.center,
                  width: width,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.white, width: 1)),
                  child: Text(
                    DateFormat('dd/MM/yyyy')
                        .format(DateTime.parse(releaseDate)),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          );
  }
}
