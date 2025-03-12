import 'package:flutter/material.dart';
import 'package:movie_app/data/services/movie_service.dart';
import 'package:movie_app/domain/models/catalog.dart';
import 'package:movie_app/domain/models/genre.dart';
import 'package:movie_app/ui/homepage/widgets/genre_catalog.dart';
import 'package:movie_app/ui/homepage/widgets/upcoming_catalog.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _movieService = MovieService();

  @override
  Widget build(BuildContext context) {
    Size deviceInfo = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: deviceInfo.width * 0.02,
            right: deviceInfo.width * 0.02,
          ),
          child: SearchBar(
            padding: WidgetStateProperty.all(EdgeInsets.only(
              left: deviceInfo.width * 0.05,
              right: deviceInfo.width * 0.05,
            )),
            trailing: [Icon(Icons.search)],
            backgroundColor: WidgetStateProperty.all(Colors.white),
            hintText: 'Pesquise seu título favorito',
          ),
        ),
        SizedBox(
          height: deviceInfo.height * 0.02,
        ),
        FutureBuilder<List<Genre>>(
          future: _movieService.getGenres(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return Text('Erro: ${snapshot.error}',
                  style: TextStyle(color: Colors.amber));
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('Nenhum gênero encontrado',
                  style: TextStyle(color: Colors.amber));
            }

            return GenresCatalog(
              snapshot.data!,
              height: deviceInfo.height * 0.15,
            );
          },
        ),
        SizedBox(
          height: deviceInfo.height * 0.036,
        ),
        FutureBuilder<Catalog>(
          future: _movieService.getUpcomingMovies(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return Text('Erro: ${snapshot.error}',
                  style: TextStyle(color: Colors.amber));
            }
            if (!snapshot.hasData) {
              return Text(
                'Nenhum filme encontrado',
                style: TextStyle(color: Colors.amber),
              );
            }

            return UpcomingCatalog(
              deviceInfo.height * 0.68,
              snapshot.data!,
            );
          },
        ),
      ],
    );
  }
}
