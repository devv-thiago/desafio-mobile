import 'package:flutter/material.dart';
import 'package:movie_app/data/services/movie_service.dart';
import 'package:movie_app/domain/models/genre.dart';
import 'package:movie_app/ui/homepage/widgets/genre_catalog.dart';

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
      spacing: deviceInfo.height * 0.03,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: deviceInfo.width * 0.05,
            right: deviceInfo.width * 0.05,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
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
        ),
        FutureBuilder<List<Genre>>(
          future: _movieService.getGenres(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return Text('Erro: ${snapshot.error}');
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('Nenhum gênero encontrado');
            }

            return GenresCatalog(
              snapshot.data!,
              height: deviceInfo.height * 0.3,
            );
          },
        ),
        FutureBuilder<List<Genre>>(
          future: _movieService.getGenres(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return Text('Erro: ${snapshot.error}');
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('Nenhum gênero encontrado');
            }

            return GenresCatalog(
              snapshot.data!,
              height: deviceInfo.height * 0.3,
            );
          },
        ),
      ],
    );
  }
}
